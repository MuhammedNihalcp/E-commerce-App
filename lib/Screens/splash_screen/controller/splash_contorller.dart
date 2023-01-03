import 'dart:async';
import 'dart:developer';

import 'package:e_commerce/Screens/auth/sign_in/view/signin_view.dart';
import 'package:e_commerce/Screens/navigator_screen/view/view.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SplashContorller extends GetxController {
  FlutterSecureStorage storage = FlutterSecureStorage();
  String? onboardValue;
  String? signinCheck;
  void splashTimer(context) {
    Timer(
      const Duration(seconds: 3),
      () async {
        onboardValue = await storage.read(key: 'onboard');
        signinCheck = await storage.read(key: 'token');
        log(signinCheck.toString());
        if (signinCheck != null) {
          Get.offAll(() => ScreenNavigator());
        } else {
          if (onboardValue != null) {
            Get.offAll(() => ScreenLogin());
          } else {
            Get.offAll(() => ScreenLogin());
          }
        }
      },
    );
  }
}
