import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/common/api/api_baseurl.dart';
import 'package:e_commerce/common/api/api_endsurl.dart';
import 'package:e_commerce/util/dio_exeption/exeptions.dart';

class ForgotPasswordService {
  final apibaseUrl = ApiBaseUrl();
  final apiendUrl = ApiEndsUrl();

  static Future<String?> getOtp(String email) async {
    final apibaseUrl = ApiBaseUrl();
    final apiendUrl = ApiEndsUrl();
    try {
      log('responce');
      Dio dio = Dio();
      log('dio');
      Response response = await dio.get(
        apibaseUrl.baseUrl + apiendUrl.verifyOtp,
        queryParameters: {"email": email},
        // options: Options(headers: AppConfig.getApiHeader(token: null)),
      );
      log('respose1');
      log(response.statusCode.toString());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return response.data["message"];
      }
    } on DioError catch (e) {
      log('catch');
      DioException().dioError(e);
    }
    return null;
  }
}
