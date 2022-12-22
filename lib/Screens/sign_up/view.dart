import 'package:e_commerce/Screens/sign_in/view.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenSignUp extends StatelessWidget {
  ScreenSignUp({super.key});

  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              kHeight10,
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Username'),
                  border: OutlineInputBorder(),
                ),
              ),
              kHeight10,
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Email Id'),
                  border: OutlineInputBorder(),
                ),
              ),
              kHeight10,
              TextFormField(
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off)),
                  label: const Text('Password'),
                  border: const OutlineInputBorder(),
                ),
              ),
              kHeight10,
              TextFormField(
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off)),
                  label: const Text('Conform Password'),
                  border: const OutlineInputBorder(),
                ),
              ),
              kHeight10,
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(
                    Size(width * 0.8, height * 0.1),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Text('Sign Up'),
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
                        'Login',style: textStyle,
                      ))
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
