import 'package:e_commerce/Screens/cart/controller/cart_controller.dart';
import 'package:e_commerce/Screens/cart/view/cart_view.dart';
import 'package:e_commerce/Screens/payment/model/order_enum.dart';
import 'package:e_commerce/Screens/payment/view/order_summery/order_summery.dart';
import 'package:e_commerce/Screens/product_view_screen/controller/product_controller.dart';
import 'package:e_commerce/Screens/product_view_screen/model/product_model.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProductBottomNavigator extends StatelessWidget {
  ProductBottomNavigator({
    Key? key,
    required this.width,
    required this.height,
    required this.contorlle,
  }) : super(key: key);

  final double width;
  final double height;
  final ProductModel contorlle;

  final productC = Get.put(ProductController());
  final cartC = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.1,
      width: double.infinity,
      color: const Color.fromARGB(255, 233, 227, 227),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(width * 0.7, height * 0.08),
              maximumSize: Size.fromHeight(height * 0.1),
              backgroundColor: Colors.yellow,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            onPressed: () {
              cartC.addToCart(contorlle.id, contorlle.size.toString());
              Get.to(() => ScreenOrder());
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: colorBlack,
            ),
            label: const Text(
              'Add Cart',
              style: TextStyle(
                color: colorBlack,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // SizedBox(
          //   width: width * 0.1,
          // ),
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(
          //       minimumSize: Size(width * 0.4, height * 0.08),
          //       backgroundColor: Colors.yellow,
          //       elevation: 0,
          //       shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(20))),
          //   onPressed: () {
          //     Get.to(
          //       () => ScreenOrderSummery(
          //         height: height,
          //         width: width,
          //         productId: contorlle.id,
          //         screenCheck: OrderScreenEnum.buyOneProductOrderScreen,
          //       ),
          //     );
          //   },
          //   child: const Text(
          //     'Buy now',
          //     style: TextStyle(
          //       fontSize: 17,
          //       color: colorBlack,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
