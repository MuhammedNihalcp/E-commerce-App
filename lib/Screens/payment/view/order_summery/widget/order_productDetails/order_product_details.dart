import 'package:e_commerce/Screens/cart/controller/cart_controller.dart';
import 'package:e_commerce/Screens/payment/controller/order_summery_controller/order_summery_controller.dart';
import 'package:e_commerce/Screens/payment/model/order_enum.dart';
import 'package:e_commerce/Screens/payment/view/order_summery/widget/order_productDetails/widget/add_remove/add_remove.dart';
import 'package:e_commerce/Screens/payment/view/order_summery/widget/order_productDetails/widget/bestselletWidget/best_sellar.dart';
import 'package:e_commerce/Screens/payment/view/order_summery/widget/order_productDetails/widget/delivary_details/delivary_detail.dart';
import 'package:e_commerce/Screens/payment/view/order_summery/widget/order_productDetails/widget/payment_product_details/payment_product_details.dart';
import 'package:e_commerce/core/size.dart';
import 'package:flutter/material.dart';

import 'package:flutter_custom_cards/flutter_custom_cards.dart';

class OrderProductDetails extends StatelessWidget {
  const OrderProductDetails({
    Key? key,
    required this.width,
    required this.height,
    required this.screenCheck,
    required this.cartcontroller,
    required this.ordercontroller,
  }) : super(key: key);

  final double width;
  final double height;
  final OrderScreenEnum screenCheck;
  final CartController cartcontroller;

  final OrderSummeryController ordercontroller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return CustomCard(
            width: double.infinity,
            height: 270,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BestSellerWidget(),
                  kHeight10,
                  PaymentProductDetails(
                    index: index,
                    cartcontroller: cartcontroller,
                    ordercontroller: ordercontroller,
                    screenCheck: screenCheck,
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
        },
        itemCount: screenCheck == OrderScreenEnum.normalOrderScreen
            ? cartcontroller.getmodel!.products.length
            : 1);
  }
}
