import 'dart:developer';

import 'package:e_commerce/Screens/account/controller/account_controller.dart';
import 'package:e_commerce/Screens/account/view/widget/accout_button.dart';
import 'package:e_commerce/Screens/account/view/widget/accout_button_widget.dart';
import 'package:e_commerce/Screens/account/view/widget/text_button_widget.dart';
import 'package:e_commerce/Screens/account/view/widget/user_name_widget.dart';
import 'package:e_commerce/Screens/account/view/widget/your_account_detail_images.dart';
import 'package:e_commerce/Screens/account/view/widget/your_account_details.dart';
import 'package:e_commerce/Screens/account/view/widget/your_cart_list.dart';
import 'package:e_commerce/Screens/account/view/widget/your_cart_list_images.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenAccount extends StatelessWidget {
  ScreenAccount({Key? key, required this.width, required this.height})
      : super(key: key);

  final accoutC = Get.put(AcountController());
  final double width;
  final double height;

  final order = [
    'https://m.media-amazon.com/images/I/619l+9g92kL._AC_SX679_.jpg',
    'https://m.media-amazon.com/images/I/81JIcyPY3CL._AC_UY679_.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: colorVailet,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'My',
              style: TextStyle(
                letterSpacing: 3,
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Account',
              style: TextStyle(
                letterSpacing: 3,
                fontWeight: FontWeight.bold,
                color: colorBlack,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              // cartC.goToCartFromProduct();
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.04),
          child: const SizedBox(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: GetBuilder<AcountController>(
              builder: (controller) => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  kHeight20,
                   UserNameImage(),
                  kHeight10,
                  AccountButton(
                    width: width,
                    height: height,
                  ),
                  kHeight10,
                  AccountButtonWidget(
                    width: width,
                    height: height,
                    controller: accoutC,
                  ),
                  const YourAccountDetails(),
                  kHeight10,
                  YourAccountDetailsImages(
                    height: height,
                    order: order,
                    width: width,
                  ),
                  kHeight20,
                  const YourCartList(),
                  YourCartListImages(
                    height: height,
                    width: width,
                    order: order,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
