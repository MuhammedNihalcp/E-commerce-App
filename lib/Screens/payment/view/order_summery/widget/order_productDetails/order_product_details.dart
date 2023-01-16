import 'dart:developer';

import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';

import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class OrderProductDetails extends StatelessWidget {
  const OrderProductDetails({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      width: double.infinity,
      height: 270,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomCard(
                  width: 85,
                  height: 25,
                  elevation: 0,
                  borderRadius: 5,
                  color: const Color.fromARGB(202, 27, 189, 111),
                  child: const Text(
                    'BESTSELLER',
                    style: TextStyle(
                      color: colorWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CustomCard(
                  width: 170,
                  height: 25,
                  elevation: 0,
                  borderRadius: 5,
                  color: const Color.fromARGB(255, 232, 255, 206),
                  child: const Text(
                    'Top Discount of the Sale',
                    style: TextStyle(color: colorGreen),
                  ),
                )
              ],
            ),
            kHeight10,
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
            Row(
              children: [
                Container(
                  height: height * 0.05,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 238, 237, 237),
                      border: Border.all(color: colorLightGrey),
                      borderRadius: const BorderRadius.all(
                          Radius.circular(10))),
                  child: Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10)),
                            backgroundColor: const Color.fromARGB(
                                255, 238, 237, 237),
                            minimumSize:
                                Size(width * 0.05, height * 0.05)),
                        onPressed: () {
                          // controller.incrementDecrementQty(
                          //   1,
                          //   controller
                          //       .cartList!.products[index].product.id,
                          //   controller.cartList!.products[index].qty,
                          //   controller
                          //       .cartList!.products[index].product.size
                          //       .toString(),
                          // );
                        },
                        child: const Icon(
                          Icons.delete_outline,
                          color: colorBlack,
                        ),
                      ),
                      Container(
                        width: width * 0.13,
                        // height: height * 0.05,
                        color:
                            const Color.fromARGB(255, 223, 220, 220),
                        child: const Center(
                          child: Text(
                            '2',
                            // controller.cartList!.products[index].qty
                            //     .toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(10)),
                              backgroundColor: const Color.fromARGB(
                                  255, 238, 237, 237),
                              minimumSize:
                                  Size(width * 0.05, height * 0.05)),
                          onPressed: () {
                            // controller.incrementDecrementQty(
                            //   1,
                            //   controller
                            //       .cartList!.products[index].product.id,
                            //   controller.cartList!.products[index].qty,
                            //   controller.cartList!.products[index]
                            //       .product.size
                            //       .toString(),
                            // );
                          },
                          child: const Icon(
                            Icons.add,
                            color: colorBlack,
                          ))
                    ],
                  ),
                ),
              ],
            ),
            kHeight10,
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
      ),
    );
  }
}
