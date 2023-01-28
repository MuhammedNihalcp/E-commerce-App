import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';

class CircularProgressWidget extends StatelessWidget {
  const CircularProgressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
          color: colorWhite,
          backgroundColor: colorVailet,
        ),
      );
  }
}