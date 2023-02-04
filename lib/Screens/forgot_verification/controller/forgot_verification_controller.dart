import 'dart:developer';

import 'package:e_commerce/Screens/auth/new_password/view/new_password_view.dart';
import 'package:e_commerce/Screens/auth/verification_code_screen/service/otp_service/verify_otp.dart';
import 'package:e_commerce/core/text_style.dart';

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

  void submitForgotOtp(String email, code) {
    if (code.length != 4) {
      Get.snackbar('OTP', 'Please enter the OTP', colorText: colorremoveSnack);
    } else {
      isLoading = true;
      update();
      verifyOtpSer.verifyOtp(email, code).then((value) {
        if (value != null) {
          log('otp success', name: 'forgot otp');
          Get.off(() => ScreenNewPassword(
                email: email,
              ));
          isLoading = false;
          update();
        }
      });
    }
  }
}
