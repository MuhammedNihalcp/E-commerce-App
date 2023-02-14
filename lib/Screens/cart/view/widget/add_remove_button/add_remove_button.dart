import 'dart:developer';

import 'package:e_commerce/Screens/cart/controller/cart_controller.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';

class AddAndRemoveButton extends StatelessWidget {
  const AddAndRemoveButton({
    Key? key,
    required this.height,
    required this.width,
    required this.totalConut,
    required this.minusPressed,
    required this.plusPressed,
    required this.index,
    required this.cartControllers,
  }) : super(key: key);

  final double height;
  final double width;
  final String totalConut;
  final void Function() minusPressed;
  final void Function() plusPressed;
  final int index;
  final CartController cartControllers;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: minusPressed,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: colorWhite,
              border: Border.all(
                width: 1,
                color: colorLightGrey,
              ),
            ),
            child: const Icon(
              Icons.remove,
              size: 16,
              color: colorBlack,
            ),
          ),
        ),
        kWidth20,
        Text(
          totalConut,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        kWidth20,
        InkWell(
          onTap: plusPressed,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: colorWhite,
              border: Border.all(
                width: 1,
                color: colorLightGrey,
              ),
            ),
            child: const Icon(
              Icons.add,
              size: 16,
              color: colorBlack,
            ),
          ),
        ),
        SizedBox(
          width: width * 0.15,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: colorWhite,
              minimumSize: Size(width * 0.2, height * 0.05),
              side: const BorderSide(
                width: 1,
                color: colorLightGrey,
              )),
          onPressed: () {
            cartControllers.removeCart(
                cartControllers.getmodel!.products[index].product.id);
          },
          child: const Text(
            'Delete',
            style: TextStyle(color: colorBlack),
          ),
        )
      ],
    );
  }
}
