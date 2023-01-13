
import 'package:e_commerce/Screens/splash_screen/controller/splash_contorller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenSplash extends StatelessWidget {
   ScreenSplash({super.key});

  final splashC = Get.put(SplashContorller());

  // @override
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) { 
      splashC.splashTimer();
    });
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 49, 49, 49),
      body: Center(
        child: Image(
          image: AssetImage('assets/images/dammy2_icon.png'),
        ),
      ),
    );
  }

  // Future<void>goToLogin()async{
  //    await Future.delayed(const Duration(seconds: 3));
  //    Get.off(()=> ScreenLogin());
  // }
}
