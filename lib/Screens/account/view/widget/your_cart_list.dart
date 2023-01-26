import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class YourCartList extends StatelessWidget {
  const YourCartList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Your Cart List',
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