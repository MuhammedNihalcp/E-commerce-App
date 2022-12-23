import 'package:e_commerce/Screens/forgot_password/view_forgot_password.dart';
import 'package:e_commerce/Screens/forgot_verification/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/size.dart';
import '../../core/text_style.dart';
import '../navigator_screen/view/view.dart';

class ScreenForgotVerification extends StatelessWidget {
  const ScreenForgotVerification({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.15),
          child: Padding(
            padding: EdgeInsets.only(right: width * 0.25),
            child: Column(
              children: [
                const Text(
                  'Verification Code',
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 30,
                      color: colorWhite,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: height * 0.08,
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
          child: Column(
            children: [
              kHeight20,
              Row(
                children: const [
                  Text(
                    'Please enter Code sent to',
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '+91 6338961357',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const ScreenForgotPassword());
                    },
                    child: const Text(
                      'Change phone number',
                      style: TextStyle(color: colorBlack),
                    ),
                  ),
                ],
              ),
              kHeight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  SizedBox(
                    height: 64.0,
                    width: 56.0,
                    child: Card(
                      color: Color.fromRGBO(173, 179, 191, 0.7),
                      child: Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          child: TextEditorForForgotEmailVerify()),
                    ),
                  ),
                  SizedBox(
                    height: 64.0,
                    width: 56.0,
                    child: Card(
                      color: Color.fromRGBO(173, 179, 191, 0.7),
                      child: Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          child: TextEditorForForgotEmailVerify()),
                    ),
                  ),
                  SizedBox(
                    height: 64.0,
                    width: 56.0,
                    child: Card(
                      color: Color.fromRGBO(173, 179, 191, 0.7),
                      child: Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          child: TextEditorForForgotEmailVerify()),
                    ),
                  ),
                  SizedBox(
                    height: 64.0,
                    width: 56.0,
                    child: Card(
                      color: Color.fromRGBO(173, 179, 191, 0.7),
                      child: Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          child: TextEditorForForgotEmailVerify()),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.1,
              ),
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
                  Get.to(() => ScreenNavigator());
                },
                child: const Text(
                  'Continue',
                  style: buttonStyle,
                ),
              ),
              kHeight20,
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Resend Code',
                    style: textStyle,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
