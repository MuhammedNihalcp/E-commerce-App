import 'dart:developer';

import 'package:e_commerce/Screens/payment/view/order_summery/widget/order_productDetails/widget/add_remove/add_remove.dart';
import 'package:e_commerce/Screens/payment/view/order_summery/widget/order_productDetails/widget/delivary_details/delivary_detail.dart';
import 'package:e_commerce/Screens/payment/view/order_summery/widget/order_productDetails/widget/payment_product_details/payment_product_details.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';

import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class OrderProductDetails extends StatelessWidget {
  const OrderProductDetails({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      width: double.infinity,
      height: 270,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomCard(
                  width: 85,
                  height: 25,
                  elevation: 0,
                  borderRadius: 5,
                  color: const Color.fromARGB(202, 27, 189, 111),
                  child: const Text(
                    'BESTSELLER',
                    style: TextStyle(
                      color: colorWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CustomCard(
                  width: 170,
                  height: 25,
                  elevation: 0,
                  borderRadius: 5,
                  color: const Color.fromARGB(255, 232, 255, 206),
                  child: const Text(
                    'Top Discount of the Sale',
                    style: TextStyle(color: colorGreen),
                  ),
                )
              ],
            ),
            kHeight10,
            PaymentProductDetails(
              width: width,
              height: height,
            ),
            kHeight20,
            PaymetProductRemoveAndAddButton(
              height: height,
              width: width,
            ),
            kHeight10,
            const DelivaryDetails(),
          ],
        ),
      ),
    );
  }
}
