import 'package:e_commerce/Screens/product_view_screen/controller/product_controller.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductBottomNavigator extends StatelessWidget {
  ProductBottomNavigator({super.key});

  final productC = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 233, 227, 227),
      child: Row(
        children: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow,
              elevation: 0,
              shape: RoundedRectangleBorder(),
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
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                elevation: 0,
                shape: RoundedRectangleBorder()),
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
