import 'dart:developer';

import 'package:e_commerce/Screens/auth/new_password/model/new_password.dart';
import 'package:e_commerce/Screens/auth/new_password/service/new_password_service.dart';
import 'package:e_commerce/Screens/auth/sign_in/view/signin_view.dart';
import 'package:e_commerce/Screens/navigator_screen/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../../../core/text_style.dart';

class NewPasswordController extends GetxController {
  TextEditingController confrompasswordController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();

  FlutterSecureStorage storage = const FlutterSecureStorage();

  bool isLoading = false;
  final newpasswordS = NewPasswordService();

  void addPassword(String email) async {
    log('newPassword');
    isLoading = true;
    update();

    final newpasswordModel = NewPasswordModel(
      email: email,
      password: newpasswordController.text.trim(),
    );
    newpasswordS.addNewPassword(newpasswordModel).then((value) {
      log('enter add new password');
      if (value != null) {
        log('enter value');
        Get.offAll(() => ScreenLogin());
        isLoading = false;
        update();
      }
      isLoading = false;
      update();
    });
  }

  String? passwordValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must have atleast 8 character';
    } else if (value.length > 8) {
      return 'Password exceeds 8 character';
    }
    return null;
  }

  String? confirmpasswordValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    } else if (value.length < 8) {
      return 'Password must have atleast 8 character';
    } else if (value != newpasswordController.text) {
      return 'Password does not match';
    } else {
      return null;
    }
  }

  void disposeTextfield() {
    newpasswordController.clear();
    confrompasswordController.clear();
  }

  bool obscureText = true;
  Icon icon = const Icon(
    Icons.visibility_off,
    color: colorBlack,
  );

  void visibility() {
    if (obscureText == false) {
      icon = const Icon(
        Icons.visibility_off,
        color: colorBlack,
      );
      obscureText = true;
      update();
    } else {
      icon = const Icon(
        Icons.visibility,
        color: colorBlack,
      );
      obscureText = false;
      update();
    }
  }
}
