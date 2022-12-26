import 'package:e_commerce/Screens/navigator_screen/view/view.dart';
import 'package:e_commerce/Screens/sign_in/model/sign_in_model.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:e_commerce/service/sign_in_service/sign_in_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  FlutterSecureStorage storage = const FlutterSecureStorage();

  SignInService signinS = SignInService();
  bool isLoading = false;

  void signIn(BuildContext context) {
    isLoading = true;
    update();
    final signinModel = SignInModel(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    signinS.signinUser(signinModel, context).then(
      (value) {
        if (value != null) {
          storage.write(key: 'token', value: value.accessToken);
          storage.write(key: 'refreshToken', value: value.refreshToken);
          Get.offAll(() => ScreenNavigator());
          disposeTextfield();
        } else {
          return;
        }
      },
    );
    isLoading = false;
    update();
  }

  void disposeTextfield() {
    emailController.clear();
    passwordController.clear();
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

  String? emailValdation(String? value) {
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
