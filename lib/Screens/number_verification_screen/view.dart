import 'package:e_commerce/Screens/sign_up/model/model.dart';
import 'package:e_commerce/Screens/verification_code_screen/view.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenVerification extends StatelessWidget {
  const ScreenVerification({
    Key? key,
    // required this.model,
  }) : super(key: key);

  // final SignUpModel model;

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
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Column(
              children: [
                const Text(
                  'What Is Your Phone Number?',
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 30,
                      color: colorWhite,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: height * 0.07,
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
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              kHeight20,
              const Text(
                'Please enter your phone number to verify your account',
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(
                height: height * 0.1,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: const Text(
                    'Phone Number',
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
                  // Get.to(() => const ScreenVerificationCode());
                },
                child: const Text(
                  'Send Verification Code',
                  style: buttonStyle,
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
