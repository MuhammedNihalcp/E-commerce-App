import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';

class CartBottomButton extends StatelessWidget {
  const CartBottomButton({
    Key? key,
    required this.text,
    this.height = 0,
    this.width = 0,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final double width;
  final double height;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: colorWhite,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          side: const BorderSide(
            width: 1,
            color: colorLightGrey,
          )),
      onPressed: () {
        onPressed;
      },
      child: Text(
        text,
        style: const TextStyle(color: colorBlack),
      ),
    );
  }
}
