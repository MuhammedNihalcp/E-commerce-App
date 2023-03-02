import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:e_commerce/Screens/auth/sign_in/view/signin_view.dart';
import 'package:e_commerce/Screens/internet_screen/view/internet_view.dart';
import 'package:e_commerce/Screens/navigator_screen/view/view.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SplashContorller extends GetxController {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? onboardValue;
  String? signinCheck;
  bool activeInternetConnection = false;

  String T = '';
  void splashTimer() {
    Timer(
      const Duration(seconds: 3),
      () async {
        onboardValue = await storage.read(key: 'onboard');
        signinCheck = await storage.read(key: 'token');
        log(signinCheck.toString());

        try {
          final connection = await InternetAddress.lookup('google.com');
          if (connection.isNotEmpty && connection[0].rawAddress.isNotEmpty) {
            activeInternetConnection = true;
            update();
            if (signinCheck != null) {
              Get.offAll(() => ScreenNavigator());
            } else {
              if (onboardValue != null) {
                Get.offAll(() => ScreenLogin());
              } else {
                Get.offAll(() => ScreenLogin());
              }
            }
          } else {
            activeInternetConnection = false;
            update();
            T = 'No Internet Connection';
            update();
            Get.offAll(() => InternetScreen());
          }
        } on SocketException catch (_) {
          activeInternetConnection = false;
          update();
          T = 'No Internet Connection';
          update();
        }
      },
    );
  }
}
