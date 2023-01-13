import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/common/api/api_baseurl.dart';
import 'package:e_commerce/common/api/api_endsurl.dart';
import 'package:e_commerce/util/dio_exeption/exeptions.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiInterceptor {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  Dio dio = Dio();
  final apiEndUrl = ApiEndsUrl();

  Future<Dio> getApiUser() async {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await storage.read(key: 'token');
          dio.interceptors.clear();
          options.headers.addAll({"Authorization": "Bearer $token"});
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioError e, handler) async {
          if (e.response != null) {
            if (e.response?.statusCode == 403 &&
                e.response?.data['message'] == 'Forbidden') {
              log('token expired');
              RequestOptions requestOptions = e.requestOptions;
              try {
                final refreshToken = await storage.read(key: 'refreshToken');
                log(refreshToken.toString());
                final opts = Options(method: requestOptions.method);
                dio.options.headers["refresh"] = "Bearer $refreshToken";
                final Response response = await dio.get(
                  ApiBaseUrl().baseUrl + apiEndUrl.refresh,
                  options: opts,
                );
                if (response.statusCode! == 200) {
                  log(response.data.toString());
                  final token = response.data['accessToken'];
                  final refreshToken = response.data['refreshToken'];
                  await storage.delete(key: 'token');
                  await storage.delete(key: 'refreshToken');
                  storage.write(key: 'token', value: token);
                  storage.write(key: 'refreshToken', value: refreshToken);
                }
              } catch (e) {
                DioException().dioError(e);
              }
              try {
                final token = await storage.read(key: 'token');
                final opts = Options(method: requestOptions.method);
                dio.options.headers["Authorization"] = "Bearer $token";
                final response = await dio.request(
                  requestOptions.path,
                  options: opts,
                  cancelToken: requestOptions.cancelToken,
                  onReceiveProgress: requestOptions.onReceiveProgress,
                  data: requestOptions.data,
                  queryParameters: requestOptions.queryParameters,
                );
                return handler.resolve(response);
              } catch (e) {
                DioException().dioError(e);
              }
            }
          } else {
            handler.next(e);
          }
        },
      ),
    );
    return dio;
  }
}
