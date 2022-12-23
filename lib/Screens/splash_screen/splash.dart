import 'package:e_commerce/Screens/sign_in/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    goToLogin();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 49, 49, 49),
      body: Center(
        child: Image(
          image: AssetImage('assets/images/dammy2_icon.png'),
        ),
      ),
    );
  }

  Future<void>goToLogin()async{
     await Future.delayed(const Duration(seconds: 3));
     Get.off(()=> ScreenLogin());
  }
}
