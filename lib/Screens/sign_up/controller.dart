import 'dart:developer';

import 'package:e_commerce/Screens/sign_up/model/model.dart';
import 'package:e_commerce/service/sign_up_service/sign_up_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> addUser(BuildContext context) async {
    final signupS = SignUpService();
    final signupmodel = SignUpModel(
        fullname: usernameController.text,
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
        password: passwordController.text.trim());

    signupS.signupUser(signupmodel, context);
    log('add succefull');
  }
}
