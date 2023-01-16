import 'dart:developer';

import 'package:e_commerce/Screens/cart/view/widget/add_remove_button/add_remove_button.dart';
import 'package:e_commerce/Screens/payment/controller/order_summery_controller/order_summery_controller.dart';
import 'package:e_commerce/Screens/payment/view/order_summery/widget/order_details/order_details.dart';
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
          builder: (controller) => Column(
            children: [
              OrderDetails(
                height: height,
              ),
              CustomCard(
                width: double.infinity,
                height: height * 0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomCard(
                          width: width * 0.2,
                          height: height * 0.03,
                          color: const Color.fromARGB(255, 26, 190, 111),
                          child: const Text(
                            'BESTSELLER',
                            style: TextStyle(
                              color: colorWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: width * 0.2,
                          height: height * 0.1,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://m.media-amazon.com/images/I/71tRdGijWjL._AC_UL1500_.jpg'),
                              // fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        kWidth10,
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Fossil Men's Grant Stainless Steel Quartz Chronograph Watch",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(),
                              ),
                              kHeight10,
                              RatingBar.builder(
                                initialRating: double.parse('4.5'),
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
                                children: const [
                                  Text(
                                    '₹ 2999',
                                    style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey,
                                      fontSize: 17,
                                    ),
                                  ),
                                  kWidth10,
                                  Text(
                                    '₹999',
                                    style: TextStyle(
                                      color: colorBlack,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                  kWidth10,
                                  Text(
                                    '66% off',
                                    style: TextStyle(
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
                    RichText(
                      text: const TextSpan(
                        text: '',
                        style: TextStyle(color: colorBlack),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Delivary by Fri jan 20 |',
                              style: TextStyle(color: colorBlack)),
                          TextSpan(
                            text: ' FREE Delivery  ',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: '₹40',
                            style: TextStyle(
                              color: colorGrey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
