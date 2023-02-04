import 'package:e_commerce/Screens/auth/new_password/model/new_password.dart';
import 'package:e_commerce/Screens/auth/new_password/service/new_password_service.dart';
import 'package:e_commerce/Screens/navigator_screen/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class NewPasswordController extends GetxController {
  TextEditingController confrompasswordController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();

  FlutterSecureStorage storage = const FlutterSecureStorage();

  bool isLoading = false;
  final newpasswordS = NewPasswordService();

  void addPassword(String email) async {
    isLoading = true;
    update();

    final newpasswordModel = NewPasswordModel(
      email: email,
      password: newpasswordController.text.trim(),
    );
    newpasswordS.addNewPassword(newpasswordModel).then((value) {
      if (value != null) {
        Get.offAll(ScreenNavigator());
        isLoading = false;
        update();
      }
      isLoading = false;
      update();
    });
  }
}
