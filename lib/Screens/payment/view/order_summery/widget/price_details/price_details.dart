import 'package:e_commerce/Screens/cart/controller/cart_controller.dart';
import 'package:e_commerce/Screens/payment/controller/order_summery_controller/order_summery_controller.dart';
import 'package:e_commerce/Screens/payment/model/order_enum.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';

import 'package:flutter_custom_cards/flutter_custom_cards.dart';

class PriceDetails extends StatelessWidget {
  PriceDetails({
    Key? key,
    required this.cartcontroller,
    required this.ordercontroller,
    required this.screenCheck,
  }) : super(key: key);

  CartController cartcontroller = CartController();
  OrderSummeryController ordercontroller = OrderSummeryController();
  final OrderScreenEnum screenCheck;

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
              children: [
                Text(
                  screenCheck == OrderScreenEnum.normalOrderScreen
                      ? 'Price (${cartcontroller.getmodel!.products.length})'
                      : 'Price  (1 item)',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  screenCheck == OrderScreenEnum.normalOrderScreen
                      ? '₹ ${cartcontroller.getmodel!.totalPrice}'
                      : '₹ ${ordercontroller.cartModel[0].product.price}',
                ),
              ],
            ),
            kHeight10,
            kHeight5,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Discount',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  screenCheck == OrderScreenEnum.normalOrderScreen
                      ? '-₹ ${cartcontroller.getmodel!.totalDiscount}'
                      : '-₹ ${ordercontroller.cartModel[0].product.discountPrice}',
                  style: const TextStyle(color: colorGreen),
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
              children: [
                const Text(
                  'Total Amount',
                  style: boldtextblackcolor,
                ),
                Text(
                  screenCheck == OrderScreenEnum.normalOrderScreen
                      ? '₹ ${cartcontroller.getmodel!.totalPrice - cartcontroller.getmodel!.totalDiscount}'
                      : '₹ ${ordercontroller.cartModel[0].product.price - ordercontroller.cartModel[0].product.discountPrice}',
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
