import 'dart:developer';

import 'package:e_commerce/Screens/navigator_screen/view/view.dart';
import 'package:e_commerce/Screens/auth/sign_in/service/google_signin/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInContorller extends GetxController {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  bool isLoading = false;
  void googleSignin() async {
    isLoading = true;
    update();
    await GoogleSignInService.googleSignIn(googleSignIn).then((value) {
      if (value != null) {
        log(value.toString());
        Get.offAll(() => ScreenNavigator());
        isLoading = false;
        update();
      } else {
        isLoading = false;
        update();
        return;
      }
    });
  }
}
