import 'dart:developer';

import 'package:e_commerce/Screens/cart/view/widget/add_remove_button/add_remove_button.dart';
import 'package:e_commerce/Screens/payment/controller/order_summery_controller/order_summery_controller.dart';
import 'package:e_commerce/Screens/payment/view/order_summery/widget/bottom_widget/bottom_widget.dart';
import 'package:e_commerce/Screens/payment/view/order_summery/widget/order_details/order_details.dart';
import 'package:e_commerce/Screens/payment/view/order_summery/widget/order_productDetails/order_product_details.dart';
import 'package:e_commerce/Screens/payment/view/order_summery/widget/price_details/price_details.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ScreenOrderSummery extends StatelessWidget {
  ScreenOrderSummery({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  final orderSC = Get.put(OrderSummeryController());

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
              'Order',
              style: TextStyle(
                letterSpacing: 3,
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Summery',
              style: TextStyle(
                letterSpacing: 3,
                fontWeight: FontWeight.bold,
                color: colorBlack,
              ),
            )
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.04),
          child: const SizedBox(),
        ),
      ),
      body: SafeArea(
        child: GetBuilder<OrderSummeryController>(
          builder: (controller) => ListView(
            children: [
              OrderDetails(
                height: height,
              ),
              OrderProductDetails(
                width: width,
                height: height,
              ),
              const PriceDetails(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomWidget(
        width: width,
        height: height,
      ),
    );
  }
}
