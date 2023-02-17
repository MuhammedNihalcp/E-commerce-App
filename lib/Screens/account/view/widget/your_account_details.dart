import 'package:e_commerce/Screens/order_placed/view/order_placed_screen.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class YourAccountDetails extends StatelessWidget {
  const YourAccountDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Your Orders',
          style: accountTextStyle,
        ),
        TextButton(
          onPressed: () {
            Get.to(() => const OrderPlacedScreen());
          },
          child: const Text(
            'See all',
            style: accountSeeall,
          ),
        ),
      ],
    );
  }
}
