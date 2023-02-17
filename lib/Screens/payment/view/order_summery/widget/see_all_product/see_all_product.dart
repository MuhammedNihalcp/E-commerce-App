import 'dart:developer';

import 'package:e_commerce/Screens/cart/controller/cart_controller.dart';
import 'package:e_commerce/Screens/cart/view/widget/cart_bottom_button/cart_bottom_button.dart';
import 'package:e_commerce/Screens/payment/view/order_summery/widget/order_productDetails/widget/add_remove/add_remove.dart';
import 'package:e_commerce/Screens/payment/view/order_summery/widget/order_productDetails/widget/bestselletWidget/best_sellar.dart';
import 'package:e_commerce/Screens/payment/view/order_summery/widget/order_productDetails/widget/delivary_details/delivary_detail.dart';
import 'package:e_commerce/common/api/api_baseurl.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';

class SeeAllProductScreen extends StatelessWidget {
  SeeAllProductScreen({super.key});

  double width = Get.width;
  double height = Get.height;

  CartController cartcontroller = Get.put(CartController());
  final apibaseUrl = ApiBaseUrl();

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
              'Purchase',
              style: TextStyle(
                letterSpacing: 3,
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ' Products',
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
              Get.back();
            },
            icon: const Icon(Icons.cancel),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.04),
          child: const SizedBox(),
        ),
      ),
      body: SafeArea(
          child: GetBuilder<CartController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return CustomCard(
                  width: double.infinity,
                  height: 270,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BestSellerWidget(),
                        kHeight20,
                        Row(
                          children: [
                            Container(
                              width: width * 0.2,
                              height: height * 0.1,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        '${apibaseUrl.baseUrl}/products/${cartcontroller.getmodel!.products[index].product.image[0]}')
                  
                                    // fit: BoxFit.cover,
                                    ),
                              ),
                            ),
                            kWidth10,
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cartcontroller
                                        .getmodel!.products[index].product.name,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(),
                                  ),
                                  kHeight10,
                                  RatingBar.builder(
                                    initialRating: double.parse(
                                      cartcontroller.getmodel!.products[index]
                                          .product.rating,
                                    ),
                                    itemSize: 15,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    ignoreGestures: true,
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (startRating) {
                                      log(startRating.toString());
                                    },
                                  ),
                                  kHeight20,
                                  Row(
                                    children: [
                                      Text(
                                        '₹${cartcontroller.getmodel!.products[index].product.price}',
                                        style: const TextStyle(
                                          decoration: TextDecoration.lineThrough,
                                          color: Colors.grey,
                                          fontSize: 17,
                                        ),
                                      ),
                                      kWidth10,
                                      Text(
                                        '₹${cartcontroller.getmodel!.products[index].product.price - cartcontroller.getmodel!.products[index].discountPrice}',
                                        style: const TextStyle(
                                          color: colorBlack,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                        ),
                                      ),
                                      kWidth10,
                                      Text(
                                        '${cartcontroller.getmodel!.products[index].product.offer}% off',
                                        style: const TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        kHeight20,
                        PaymetProductRemoveAndAddButton(
                          height: height,
                          width: width,
                        ),
                        kHeight20,
                        const DelivaryDetails(),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox();
              },
              itemCount: 1),
        ),
      )),
    );
  }
}
