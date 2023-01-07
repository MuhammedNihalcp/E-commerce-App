import 'package:e_commerce/Screens/product_view_screen/controller/product_controller.dart';
import 'package:e_commerce/Screens/product_view_screen/model/product_model.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail(
      {Key? key, required this.controlle, required this.controller})
      : super(key: key);

  final ProductModel controlle;
  final ProductController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              controlle.price.toString(),
              style: const TextStyle(color: colorBlack),
            ),
          ],
        ),
        kHeight20,
        Row(
          children: const [
            Text(
              'Size',
              style: TextStyle(
                color: colorBlack,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          children: List.generate(
            controlle.size.length,
            (index) => Padding(
              padding: const EdgeInsets.all(5.0),
              child: Material(
                child: InkWell(
                  borderRadius: BorderRadius.circular(3),
                  onTap: () => controller.onSizeSelected(index),
                  child: Ink(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: controller.activeSize == index
                            ? const Color(0xFF667EEA)
                            : const Color(0xFFF3F3F3),
                        borderRadius: BorderRadius.circular(3)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        controlle.size[index],
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: controller.activeSize == index
                                ? Colors.white
                                : Colors.black87),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
