import 'package:e_commerce/Screens/cart/controller/cart_controller.dart';
import 'package:e_commerce/Screens/payment/controller/order_summery_controller/order_summery_controller.dart';
import 'package:e_commerce/Screens/payment/model/order_enum.dart';
import 'package:e_commerce/Screens/payment/view/payment/payment.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomWidget extends StatelessWidget {
  BottomWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.cartcontroller,
    required this.ordercontroller,
    required this.screencheck,
  }) : super(key: key);

  final double width;
  final double height;
  CartController cartcontroller = CartController();
  OrderSummeryController ordercontroller = OrderSummeryController();
  final OrderScreenEnum screencheck;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      color: colorWhite,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  screencheck == OrderScreenEnum.normalOrderScreen
                      ? '₹ ${cartcontroller.getmodel!.totalPrice - cartcontroller.getmodel!.totalDiscount}'
                      : '₹ ${ordercontroller.cartModel[0].product.price - ordercontroller.cartModel[0].product.discountPrice}',
                  style: const TextStyle(
                    color: colorBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const Text(
                  'View price details',
                  style: TextStyle(color: Colors.blue),
                )
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  minimumSize: Size(width * 0.5, height * 0.08)),
              onPressed: () {
                Get.to(() => ScreenPayment(
                      width: width,
                      height: height,
                    ));
              },
              child: const Text(
                'CONTINUE',
                style: TextStyle(
                  color: colorWhite,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
