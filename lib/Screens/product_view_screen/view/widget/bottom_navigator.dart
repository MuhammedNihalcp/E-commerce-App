import 'package:e_commerce/Screens/product_view_screen/controller/product_controller.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProductBottomNavigator extends StatelessWidget {
  ProductBottomNavigator({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  final productC = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.1,
      width: double.infinity,
      color: const Color.fromARGB(255, 233, 227, 227),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(width * 0.4, height * 0.08),
              maximumSize: Size.fromHeight(height * 0.1),
              backgroundColor: Colors.yellow,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              color: colorBlack,
            ),
            label: const Text(
              'Add Cart',
              style: TextStyle(
                color: colorBlack,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: width * 0.1,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: Size(width * 0.4, height * 0.08),
                backgroundColor: Colors.yellow,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            onPressed: () {},
            child: const Text(
              'Buy now',
              style: TextStyle(
                fontSize: 17,
                color: colorBlack,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
