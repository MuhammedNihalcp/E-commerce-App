import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';

class DelivaryDetails extends StatelessWidget {
  const DelivaryDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
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
    );
  }
}
