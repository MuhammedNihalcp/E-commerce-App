import 'dart:developer';

import 'package:e_commerce/Screens/auth/sign_in/model/google_model/google_model.dart';
import 'package:e_commerce/Screens/navigator_screen/view/view.dart';
import 'package:e_commerce/Screens/auth/sign_in/service/google_signin/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInContorller extends GetxController {
  String? email;
  String? name;
  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  bool isLoading = false;
  void googleSignins() async {
    isLoading = true;
    update();

    googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      if (account != null) {
        email = account.email;
        name = account.displayName;
        update();
      }
    });
    final googlemodel = GoogleModel(
      email: email!,
      name: name,
    );
    await GoogleSignInService().googleSignIn(googlemodel).then((value) {
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
