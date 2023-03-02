import 'package:e_commerce/Screens/splash_screen/controller/splash_contorller.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class InternetScreen extends StatelessWidget {
  InternetScreen({super.key});
  final splashcontorller = Get.put(SplashContorller());
  double width = Get.width;
  double height = Get.height;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: GetBuilder<SplashContorller>(
        builder: (controller) => SafeArea(
          child: Column(
            children: [
              Text(
                splashcontorller.T,
                style: gooleaborto,
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
                  splashcontorller.splashTimer();
                },
                child: const Text(
                  'Refresh',
                  style: buttonStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
