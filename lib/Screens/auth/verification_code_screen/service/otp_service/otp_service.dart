import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/common/api/api_baseurl.dart';
import 'package:e_commerce/common/api/api_endsurl.dart';
import 'package:e_commerce/util/dio_exeption/exeptions.dart';

class OtpServices {
  Dio dio = Dio();
  final apibaseUrl = ApiBaseUrl();
  final apiendUrl = ApiEndsUrl();
  Future<String?> sendOtp(email) async {
    log('otp enabled');
    try {
      final Response response = await dio.get(
        apibaseUrl.baseUrl + apiendUrl.verifyOtp,
        queryParameters: {"email": email},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('otp created');
        log('otp done');
        return response.data['message'];
      }
    } on DioError catch (e) {
      log(e.message, name: 'status code');
      log('otp failed');
      DioException().dioError(e);
    }
    return null;
  }
}
