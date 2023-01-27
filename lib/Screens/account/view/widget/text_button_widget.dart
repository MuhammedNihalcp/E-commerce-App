import 'dart:developer';

import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';


class TextButtonWidget extends StatelessWidget {
   TextButtonWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final double width;
  final double height;

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        side: const BorderSide(
          width: 1,
          color: colorGrey,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        minimumSize: Size(
          width * 0.4,
          height * 0.08,
        ),
      ),
      onPressed: () {
        onPressed;
        log(onPressed.toString());
        
      },
      child: Text(
        text,
        style: const TextStyle(color: colorBlack),
      ),
    );
  }
}
