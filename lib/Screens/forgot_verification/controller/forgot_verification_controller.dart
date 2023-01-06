import 'dart:developer';

import 'package:e_commerce/Screens/auth/new_password/view/new_password_view.dart';
import 'package:e_commerce/Screens/auth/verification_code_screen/service/otp_service/verify_otp.dart';
import 'package:e_commerce/util/error_popup/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotVerifyController extends GetxController {
  final verifyOtpSer = VerifyOtpService();
  bool isLoading = false;
  String code = '';

  void onSubmitCode(String submitCode) {
    log(submitCode, name: 'submitcode');
    code = submitCode;
    update();
  }

  void submitForgotOtp(String email, code, context) {
    if (code.length != 4) {
      SnackBarPop.popUp(context, 'Please enter the OTP', Colors.red);
    } else {
      isLoading = true;
      update();
      verifyOtpSer.verifyOtp(email, code, context).then((value) {
        if (value != null) {
          log('otp success', name: 'forgot otp');
          Get.off(() => const ScreenNewPassword());
          isLoading = false;
          update();
        }
      });
    }
  }
}
