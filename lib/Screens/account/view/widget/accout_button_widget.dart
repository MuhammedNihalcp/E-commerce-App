import 'dart:developer';

import 'package:e_commerce/Screens/account/controller/account_controller.dart';
import 'package:e_commerce/Screens/account/view/widget/text_button_widget.dart';
import 'package:e_commerce/Screens/account_setting/view/account_setting.dart';
import 'package:e_commerce/Screens/cart/view/cart_view.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AccountButtonWidget extends StatelessWidget {
  const AccountButtonWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.controller,
  }) : super(key: key);

  final double width;
  final double height;
  final AcountController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            side: const BorderSide(
              width: 1,
              color: colorGrey,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            minimumSize: Size(
              width * 0.4,
              height * 0.08,
            ),
          ),
          onPressed: () {
            Get.to(
              () => ScreenAccountSetting(
                width: width,
                height: height,
              ),
            );
          },
          child: const Text(
            'Your Account',
            style: TextStyle(color: colorBlack),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            side: const BorderSide(
              width: 1,
              color: colorGrey,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            minimumSize: Size(
              width * 0.4,
              height * 0.08,
            ),
          ),
          onPressed: () {
            Get.to(() => ScreenOrder());
          },
          child: const Text(
            'Your Cart',
            style: TextStyle(color: colorBlack),
          ),
        ),
      ],
    );
  }
}
