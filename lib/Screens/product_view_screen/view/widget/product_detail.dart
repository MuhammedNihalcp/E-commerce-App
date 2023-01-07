import 'dart:developer';

import 'package:e_commerce/Screens/product_view_screen/controller/product_controller.dart';
import 'package:e_commerce/Screens/product_view_screen/model/product_model.dart';
import 'package:e_commerce/Screens/product_view_screen/view/widget/offer_text.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({
    Key? key,
    required this.controlle,
    required this.controller,
  }) : super(key: key);

  final ProductModel controlle;
  final ProductController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: controlle.rating,
                  style: const TextStyle(color: colorBlack),
                  children: [
                    WidgetSpan(
                      child: RatingBar.builder(
                        initialRating: double.parse(controlle.rating),
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
                    )
                  ],
                ),
              ),
              const Text(
                'In Stock',
                style: TextStyle(color: Colors.green),
              )
            ],
          ),
          kHeight10,
          ReadMoreText(
            controlle.description,
            trimLines: 2,
            colorClickableText: Colors.pink,
            trimMode: TrimMode.Line,
            trimCollapsedText: ' Show more',
            trimExpandedText: ' Show less',
            moreStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: readmoreColor,
            ),
            lessStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: readmoreColor,
            ),
          ),
          kHeight10,
          Row(
            children: [
              Text(
                '₹ ${controlle.price.toString()}',
                style: const TextStyle(
                    color: colorBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ],
          ),
          kHeight20,
          Row(
            children: const [
              Text(
                'Size',
                style: TextStyle(
                  color: colorBlack,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: List.generate(
              controlle.size.length,
              (index) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: Material(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(3),
                    onTap: () => controller.onSizeSelected(index),
                    child: Ink(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: controller.activeSize == index
                              ? const Color(0xFF667EEA)
                              : const Color(0xFFF3F3F3),
                          borderRadius: BorderRadius.circular(3)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          controlle.size[index],
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  color: controller.activeSize == index
                                      ? Colors.white
                                      : Colors.black87),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Text(
            'Available Offers',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          OfferTextWidget().offerText(' Bank offer starts at 5% cashback'),
          OfferTextWidget()
              .offerText(' Cash On Delivery Free up to all products on Evo'),
          OfferTextWidget().offerText(' No cost EMI/coupons up to 10% Off'),
        ],
      ),
    );
  }
}
