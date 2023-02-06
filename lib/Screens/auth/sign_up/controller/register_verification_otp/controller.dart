import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/Screens/navigator_screen/view/view.dart';
import 'package:e_commerce/Screens/auth/sign_up/model/model.dart';
import 'package:e_commerce/Screens/auth/verification_code_screen/service/otp_service/verify_otp.dart';
import 'package:e_commerce/Screens/auth/sign_up/service/sign_up_service/sign_up_service.dart';
import 'package:e_commerce/core/text_style.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  final verifyOtpS = VerifyOtpService();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  Dio dio = Dio();
  bool isLoading = false;
  String code = '';
   SignUpModel? userModel;

  void onSubmitCode(String submitCode) {
    log(submitCode, name: 'submitcode');
    code = submitCode;
    update();
  }

  void sumbitOtp(SignUpModel model, code) {
    if (code.length != 4) {
      Get.snackbar('OTP', 'Please enter the OTP', colorText: colorremoveSnack);
    } else {
      isLoading = true;
      update();
      verifyOtpS.verifyOtp(model.email, code).then(
        (value) {
          if (value != null) {
            userModel = model;
            update();
            SignUpService().signupUser(model).then((value) {
              if (value != null) {
                storage.write(key: 'token', value: value.accessToken);
                storage.write(key: 'refreshToken', value: value.refreshToken);
                Get.offAll(() => ScreenNavigator());
                isLoading = false;
                update();
              }
            });
          }
        },
      );
    }
  }
}
