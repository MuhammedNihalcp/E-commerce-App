import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/Screens/navigator_screen/view/view.dart';
import 'package:e_commerce/Screens/sign_up/model/model.dart';
import 'package:e_commerce/service/otp_service/verify_otp.dart';
import 'package:e_commerce/service/sign_up_service/sign_up_service.dart';
import 'package:e_commerce/util/error_popup/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  final verifyOtpS = VerifyOtpService();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  Dio dio = Dio();
  bool isLoading = false;
  String code = '';

  void onSubmitCode(String submitCode) {
    log(submitCode, name: 'submitcode');
    code = submitCode;
    update();
  }

  void sumbitOtp(SignUpModel model, code, context) {
    if (code.length != 4) {
      SnackBarPop.popUp(context, 'Please enter the OTP', Colors.red);
    } else {
      isLoading = true;
      update();
      verifyOtpS.verifyOtp(model.email, code, context).then(
        (value) {
          if (value != null) {
            SignUpService().signupUser(model, context).then((value) {
              if (value != null) {
                storage.write(key: 'token', value: value.accessToken);
                storage.write(key: 'refreshToken', value: value.refreshToken);
                Get.off(() => ScreenNavigator());
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
