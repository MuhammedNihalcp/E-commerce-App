import 'package:e_commerce/Screens/auth/new_password/controller/new_password_controller.dart';
import 'package:e_commerce/core/text_style.dart';
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

  double width = Get.size.width;
  double height = Get.size.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.15),
          child: Padding(
            padding: EdgeInsets.only(right: width * 0.3),
            child: Column(
              children: [
                const Text(
                  'New Password',
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 30,
                      color: colorWhite,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: height * 0.09,
                )
              ],
            ),
          ),
        ),
        elevation: 15,
        backgroundColor: colorVailet,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(2000),
          ),
        ),
      ),
      body: SafeArea(
        child: GetBuilder<NewPasswordController>(
          builder: (controller) => Column(
            children: [
              TextFormField(
                controller: newPasswordC.newpasswordController,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) => newPasswordC.passwordValdation(value),
                obscureText: newPasswordC.obscureText,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      newPasswordC.visibility();
                    },
                    icon: newPasswordC.icon,
                    color: colorBlack,
                  ),
                  label: const Text(
                    'New Password',
                    style: TextStyle(color: colorBlack),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(20)),
                  errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              TextFormField(
                controller: newPasswordC.confrompasswordController,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) =>
                    newPasswordC.confirmpasswordValdation(value),
                obscureText: newPasswordC.obscureText,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      newPasswordC.visibility();
                    },
                    icon: newPasswordC.icon,
                    color: colorBlack,
                  ),
                  label: const Text(
                    'Password',
                    style: TextStyle(color: colorBlack),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(20)),
                  errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  newPasswordC.addPassword(email);
                },
                child: Text('continue'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
