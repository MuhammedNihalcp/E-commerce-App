import 'dart:developer';

import 'package:e_commerce/Screens/cart/controller/cart_controller.dart';
import 'package:e_commerce/Screens/payment/controller/order_summery_controller/order_summery_controller.dart';
import 'package:e_commerce/Screens/payment/model/order_enum.dart';
import 'package:e_commerce/common/api/api_baseurl.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PaymentProductDetails extends StatelessWidget {
  PaymentProductDetails(
      {Key? key,
      required this.width,
      required this.height,
      required this.screenCheck,
      required this.cartcontroller,
      required this.ordercontroller,
      required this.index})
      : super(key: key);

  final double width;
  final double height;
  final OrderScreenEnum screenCheck;
  ApiBaseUrl apibaseurl = ApiBaseUrl();
  final CartController cartcontroller;
  final int index;
  final OrderSummeryController ordercontroller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: width * 0.2,
          height: height * 0.1,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(screenCheck ==
                        OrderScreenEnum.normalOrderScreen
                    ? '${apibaseurl.baseUrl}/products/${cartcontroller.getmodel!.products[index].product.image[4]}'
                    : '${apibaseurl.baseUrl}/products/${ordercontroller.cartModel[0].product.image[4]}')

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
                screenCheck == OrderScreenEnum.normalOrderScreen
                    ? cartcontroller
                        .getmodel!.products[index].product.description
                    : ordercontroller.cartModel[0].product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(),
              ),
              kHeight10,
              RatingBar.builder(
                initialRating: double.parse(
                  screenCheck == OrderScreenEnum.normalOrderScreen
                      ? cartcontroller.getmodel!.products[index].product.rating
                      : ordercontroller.cartModel[0].product.rating,
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
                    screenCheck == OrderScreenEnum.normalOrderScreen
                        ? '₹${cartcontroller.getmodel!.products[index].product.price}'
                        : '₹${ordercontroller.cartModel[0].product.price}',
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                      fontSize: 17,
                    ),
                  ),
                  kWidth10,
                  Text(
                    screenCheck == OrderScreenEnum.normalOrderScreen
                        ? '₹${cartcontroller.getmodel!.products[index].product.price - cartcontroller.getmodel!.products[index].discountPrice}'
                        : '₹${ordercontroller.cartModel[0].product.price - ordercontroller.cartModel[0].discountPrice}',
                    style: const TextStyle(
                      color: colorBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  kWidth10,
                  Text(
                    screenCheck == OrderScreenEnum.normalOrderScreen
                        ? '${cartcontroller.getmodel!.products[index].product.offer}% off'
                        : '${ordercontroller.cartModel[0].product.offer}% off',
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
    );
  }
}
