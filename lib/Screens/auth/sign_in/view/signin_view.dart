import 'package:e_commerce/Screens/auth/forgot_password/view/view_forgot_password.dart';
import 'package:e_commerce/Screens/auth/sign_in/controller/signin_controller.dart';
import 'package:e_commerce/Screens/auth/sign_up/view/signup_view.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});

  bool passwordVisible = false;
  final signinController = Get.put(SignInController());
  final formGlobalKey = GlobalKey<FormState>();

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
            padding: EdgeInsets.only(right: width * 0.6),
            child: Column(
              children: [
                const Text(
                  'Login',
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
        child: GetBuilder<SignInController>(
          builder: (controller) => SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: formGlobalKey,
                  child: Column(
                    children: [
                      kHeight10,
                      kHeight20,
                      TextFormField(
                        controller: signinController.emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) =>
                            signinController.emailValdation(value),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          label: const Text(
                            'Email id',
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
                      TextFormField(
                        controller: signinController.passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) =>
                            signinController.passwordValdation(value),
                            obscureText: signinController.obscureText,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              signinController.visibility();
                            },
                            icon: signinController.icon,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Get.to(() => const ScreenForgotPassword());
                              },
                              child: const Text(
                                'Forget Password?',
                                style: TextStyle(
                                  color: colorBlack,
                                ),
                              )),
                        ],
                      ),
                      kHeight10,
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(buttonColor),
                          fixedSize: MaterialStateProperty.all(
                            Size(width * 0.8, height * 0.08),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        onPressed: () {
                          if(formGlobalKey.currentState!.validate()){
                            formGlobalKey.currentState!.save();
                            signinController.signIn(context);
                          }
                        },
                        child: const Text(
                          'SIGN IN',
                          style: buttonStyle,
                        ),
                      ),
                      kHeight10,
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't Have an Account?",
                              style: TextStyle(color: colorBlack),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.to(() => ScreenSignUp());
                                },
                                child: const Text(
                                  'Register',
                                  style: textStyle,
                                )),
                          ]),
                      const Text('or'),
                      kHeight10,
                      const Text(
                        'Continue with',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Image(
                              width: width * 0.3,
                              height: height * 0.1,
                              image: const AssetImage(
                                  'assets/images/google_logo.png'),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Image(
                                width: width * 0.3,
                                height: height * 0.08,
                                image: const AssetImage(
                                    'assets/images/facebook_logo.png')),
                          )
                        ],
                      )
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
