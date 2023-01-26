import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class YourAccountDetails extends StatelessWidget {
  const YourAccountDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Your Orders',
          style: accountTextStyle,
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'See all',
            style: accountSeeall,
          ),
        ),
      ],
    );
  }
}