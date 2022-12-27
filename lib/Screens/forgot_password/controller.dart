import 'dart:developer';

import 'package:e_commerce/service/forgot_password/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;
  void navigatorToOtp(GlobalKey<FormState> formKey,BuildContext context) async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      update();
      await ForgetPasswordServices.getOtp(emailController.text,context).then((value) {
        if (value != null) {
          // Get.to(
          //   ScreenOtp(
          //     otpEmail: emailController.text,
          //     type: Actiontype.forgetPassword,
          //   ),
          // );
          isLoading = false;
          update();
        } else {
          isLoading = false;
          update();
          log('called');
          return;
        }
      });
    }
  }
}
