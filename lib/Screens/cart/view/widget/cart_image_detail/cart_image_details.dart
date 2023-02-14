import 'package:e_commerce/Screens/cart/controller/cart_controller.dart';
import 'package:e_commerce/common/api/api_baseurl.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';

class CartImageAndDetails extends StatelessWidget {
  CartImageAndDetails({
    Key? key,
    required this.width,
    required this.height,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final double width;
  final double height;
  final CartController controller;
  final int index;
  final apibaseUrl = ApiBaseUrl();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: width * 0.4,
          height: height * 0.18,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  '${apibaseUrl.baseUrl}/products/${controller.getmodel!.products[index].product.image[0]}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        kWidth10,
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.getmodel!.products[index].product.description,
                textWidthBasis: TextWidthBasis.longestLine,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  color: colorBlack,
                ),
              ),
              kHeight10,
              Text(
                controller.getmodel!.products[index].product.price.toString(),
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight10,
              const Text(
                'In stock',
                style: TextStyle(color: Colors.green),
              ),
              kHeight5,
              RichText(
                text: TextSpan(
                  text: '',
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    const TextSpan(
                        text: 'Size:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: controller
                            .getmodel!.products[index].product.size[0]),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
