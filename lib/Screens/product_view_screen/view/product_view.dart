import 'package:e_commerce/Screens/home/controller/home_controller.dart';

import 'package:e_commerce/Screens/product_view_screen/controller/product_controller.dart';

import 'package:e_commerce/Screens/product_view_screen/view/widget/bottom_navigator.dart';
import 'package:e_commerce/Screens/product_view_screen/view/widget/product_detail.dart';
import 'package:e_commerce/Screens/product_view_screen/view/widget/product_view_carousal.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ScreenProductView extends StatelessWidget {
  ScreenProductView({super.key});

  static String routeName = '/product_view.dart';

  final productC = Get.put(ProductController());

  List<String> sizes = [
    '35',
    '41',
    '44',
  ];
  final homeC = Get.put(HomeContorller());
  @override
  Widget build(BuildContext context) {
    double width = Get.size.width;
    double height = Get.size.height;
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final controlle = homeC.findById(productId);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<ProductController>(
            builder: (controller) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ProductViewCarousal(
                      height: height,
                      productC: productC,
                      width: width,
                      controlle: controlle),
                  kHeight20,
                  kHeight20,
                  ProductDetail(
                    controlle: controlle,
                    controller: productC,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: ProductBottomNavigator(
        width: width,
        height: height,
      ),
    );
  }
}
