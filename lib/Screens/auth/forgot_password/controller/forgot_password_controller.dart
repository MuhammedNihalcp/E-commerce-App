import 'dart:developer';

import 'package:e_commerce/Screens/auth/forgot_password/service/forgot_password_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;
  void navigatorToOtp(
      GlobalKey<FormState> formKey, BuildContext context) async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      update();
      await ForgotPasswordService.getOtp(emailController.text, context)
          .then((value) {
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

  String? forgotemailValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value)) {
      return 'Invalid email , please enter correct email';
    } else {
      return null;
    }
  }
}
