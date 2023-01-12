import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';


class CartImageAndDetails extends StatelessWidget {
  const CartImageAndDetails({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: width * 0.4,
          height: height * 0.18,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://thumbs.dreamstime.com/b/gold-watch-13362757.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        kWidth10,
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Mens Watches BY BENYAR Chronograph Analog Quartz Movement Stylish Sports Designer Wrist Watch 30M Waterproof Elegant Gift Watch for Men',
                textWidthBasis: TextWidthBasis.longestLine,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  color: colorBlack,
                ),
              ),
              kHeight10,
              const Text(
                '₹ 4999',
                style: TextStyle(
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
                  children: const <TextSpan>[
                    TextSpan(
                        text: 'Size:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '44MM'),
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