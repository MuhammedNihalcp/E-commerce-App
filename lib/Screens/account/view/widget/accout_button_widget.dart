import 'dart:developer';

import 'package:e_commerce/Screens/account/controller/account_controller.dart';
import 'package:e_commerce/Screens/account/view/widget/text_button_widget.dart';
import 'package:e_commerce/Screens/account_setting/view/account_setting.dart';
import 'package:e_commerce/Screens/cart/view/cart_view.dart';
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
        TextButtonWidget(
          width: width,
          height: height,
          text: 'Your Account',
          onPressed: () {
            Get.to(
              () => ScreenAccountSetting(
                width: width,
                height: height,
              ),
            );
          },
        ),
        TextButtonWidget(
          width: width,
          height: height,
          text: 'Your Cart',
          onPressed: () {
            Get.to(() => ScreenOrder());
          },
        ),
      ],
    );
  }
}
