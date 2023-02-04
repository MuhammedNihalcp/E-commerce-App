import 'package:e_commerce/Screens/auth/new_password/controller/new_password_controller.dart';
import 'package:e_commerce/util/textfield/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenNewPassword extends StatelessWidget {
  ScreenNewPassword({
    super.key,
    required this.email,
  });
  final String email;
  final newPasswordC = Get.put(NewPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextFromFieldWidget(
              textController: newPasswordC.newpasswordController,
              nullText: 'New password empty',
              obscureText: true,
              icon: Icon(Icons.visibility_off),
              text: 'New Password',
              textInputType: TextInputType.name,
            ),
            TextFromFieldWidget(
                textController: newPasswordC.confrompasswordController,
                nullText: 'Conform password empty',
                obscureText: true,
                icon: Icon(Icons.visibility_off),
                text: 'Conform Password',
                textInputType: TextInputType.name),
          ],
        ),
      ),
    );
  }
}
