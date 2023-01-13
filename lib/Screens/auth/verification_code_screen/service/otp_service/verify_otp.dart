import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/common/api/api_baseurl.dart';
import 'package:e_commerce/common/api/api_endsurl.dart';
import 'package:e_commerce/util/dio_exeption/exeptions.dart';

class VerifyOtpService {
  Dio dio = Dio();
  final apibaseUrl = ApiBaseUrl();
  final apiendUrl = ApiEndsUrl();
  Future<String?> verifyOtp(email, otpCode) async {
    try {
      final Response response = await dio.post(
        apibaseUrl.baseUrl + apiendUrl.verifyOtp,
        data: {
          'email': email,
          'otp': otpCode,
        },
      );
      log(response.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        log('otp verified');
        return response.data['message'];
      }
    } on DioError catch (e) {
      log(e.message);
      log('verification faliled');
      DioException().dioError(e);
    }
    return null;
  }
}
