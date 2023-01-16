import 'dart:developer';

import 'package:e_commerce/Screens/cart/view/widget/add_remove_button/add_remove_button.dart';
import 'package:e_commerce/Screens/payment/controller/order_summery_controller/order_summery_controller.dart';
import 'package:e_commerce/Screens/payment/view/order_summery/widget/order_details/order_details.dart';
import 'package:e_commerce/Screens/payment/view/order_summery/widget/order_productDetails/order_product_details.dart';
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
    );
  }
}

class PriceDetails extends StatelessWidget {
  const PriceDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      width: double.infinity,
      height: 210,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Price Details',
              style: TextStyle(
                color: colorBlack,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            kHeight20,
            kHeight5,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Price  (1 item)',
                  style: TextStyle(fontSize: 16),
                ),
                Text('₹ 2,999'),
              ],
            ),
            kHeight10,
            kHeight5,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Discount',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '-₹ 2,999',
                  style: TextStyle(color: colorGreen),
                ),
              ],
            ),
            kHeight10,
            kHeight5,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Delivery Charges',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'FREE Delivary',
                  style: TextStyle(
                    color: colorGreen,
                  ),
                ),
              ],
            ),
            kHeight5,
            const Divider(
              thickness: 2,
            ),
            kHeight5,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Total Amount',
                  style: boldtextblackcolor,
                ),
                Text(
                  '₹ 999',
                  style: boldtextblackcolor,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
