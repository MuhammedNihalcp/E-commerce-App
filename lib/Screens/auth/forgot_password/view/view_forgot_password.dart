import 'dart:developer';

import 'package:e_commerce/Screens/auth/forgot_password/controller/forgot_password_controller.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenForgotPassword extends StatelessWidget {
  ScreenForgotPassword({super.key});

  final formKey = GlobalKey<FormState>();

  final forgotPasswordController = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    double width = Get.size.width;
    double height = Get.size.height;
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.15),
          child: Padding(
            padding: EdgeInsets.only(right: width * 0.3),
            child: Column(
              children: [
                const Text(
                  'Forgot Password',
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
            borderRadius:
                BorderRadius.only(bottomRight: Radius.circular(2000))),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GetBuilder<ForgotPasswordController>(
            builder: (controller) => Column(
              children: [
                kHeight20,
                const Text(
                  'Please enter your email id to verify your email id',
                  style: TextStyle(color: colorBlack, fontSize: 17),
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                Form(
                  key: formKey,
                  child: TextFormField(
                    controller: forgotPasswordController.emailController,
                    validator: (value) =>
                        forgotPasswordController.forgotemailValdation(value),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      label: const Text(
                        'Email Id',
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
                ),
                kHeight20,
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(buttonColor),
                    fixedSize: MaterialStateProperty.all(
                      Size(width * 0.8, height * 0.08),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () {
                    log('forgot password',name: 'onpressed');
                    forgotPasswordController.navigatorToOtp(formKey);
                    // Get.to(() => const ScreenForgotVerification());
                  },
                  child: const Text(
                    'Reset',
                    style: buttonStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
