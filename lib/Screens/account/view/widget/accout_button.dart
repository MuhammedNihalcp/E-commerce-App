import 'package:e_commerce/Screens/account/view/widget/text_button_widget.dart';
import 'package:e_commerce/Screens/order_placed/view/order_placed_screen.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountButton extends StatelessWidget {
  const AccountButton({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

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
          onPressed: () {},
          child: const Text(
            'Buy Again',
            style: TextStyle(color: colorBlack),
          ),
        ),
        TextButtonWidget(
          width: width,
          height: height,
          text: 'Your Order',
          onPressed: () {
            Get.to(() => const OrderPlacedScreen());
          },
        ),
      ],
    );
  }
}
