import 'dart:developer';

import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PaymentProductDetails extends StatelessWidget {
  const PaymentProductDetails({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}