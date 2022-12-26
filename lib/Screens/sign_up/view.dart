import 'package:e_commerce/Screens/sign_in/view.dart';
import 'package:e_commerce/Screens/sign_up/controller.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ScreenSignUp extends StatelessWidget {
  ScreenSignUp({super.key});

  bool passwordVisible = false;
  final signupController = Get.put(SignUpController());
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.15),
          child: Padding(
            padding: EdgeInsets.only(right: width * 0.6),
            child: Column(
              children: [
                const Text(
                  'Sign Up',
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
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<SignUpController>(
            builder: (controller) => Form(
              key: formGlobalKey,
              child: Column(
                children: [
                  kHeight10,
                  TextFormField(
                    validator: ((value) =>
                        signupController.nameValidation(value)),
                    controller: signupController.usernameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: const Text(
                        'Username',
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
                  kHeight10,
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) =>
                        signupController.mobileValdation(value),
                    controller: signupController.phoneController,
                    decoration: InputDecoration(
                      label: const Text(
                        'Phone',
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
                  kHeight10,
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: ((value) =>
                        signupController.emailValdation(value)),
                    controller: signupController.emailController,
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
                  kHeight10,
                  TextFormField(
                    obscureText: signupController.obscureText,
                    keyboardType: TextInputType.visiblePassword,
                    validator: ((value) =>
                        signupController.passwordValdation(value)),
                    controller: signupController.passwordController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          signupController.visibility();
                        },
                        icon: signupController.icon,
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
                  kHeight10,
                  TextFormField(
                    obscureText: signupController.obscureText,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) =>
                        signupController.confirmpasswordValdation(value),
                    controller: signupController.conformpasswordController,
                    decoration: InputDecoration(
                      // suffixIcon: IconButton(
                      //   onPressed: () {},
                      //   icon: Icon(passwordVisible
                      //       ? Icons.visibility
                      //       : Icons.visibility_off),
                      //   color: colorBlack,
                      // ),
                      label: const Text(
                        'Conform Password',
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
                  kHeight10,
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
                      if (formGlobalKey.currentState!.validate()) {
                        formGlobalKey.currentState!.save();
                        signupController.addUser(context);
                      }
                    },
                    child: const Text(
                      'SIGH UP',
                      style: buttonStyle,
                    ),
                  ),
                  kHeight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      TextButton(
                        onPressed: () {
                          Get.to(() => ScreenLogin());
                        },
                        child: const Text(
                          'Login',
                          style: textStyle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
