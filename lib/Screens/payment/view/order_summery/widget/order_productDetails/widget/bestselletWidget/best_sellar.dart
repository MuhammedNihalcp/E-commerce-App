import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';

class BestSellerWidget extends StatelessWidget {
  const BestSellerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
