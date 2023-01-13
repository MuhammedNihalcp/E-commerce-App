import 'package:e_commerce/Screens/account/controller/account_controller.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenAccount extends StatelessWidget {
  ScreenAccount({Key? key, required this.width, required this.height})
      : super(key: key);

  final accoutC = Get.put(AcountController());
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: GetBuilder<AcountController>(
        builder: (controller) => SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  accoutC.logout();
                },
                child: const Text(
                  'Logout',
                  style: TextStyle(color: colorBlack),
                ))
          ],
        )),
      ),
    );
  }
}
