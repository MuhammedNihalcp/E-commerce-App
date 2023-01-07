import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/Screens/home/controller/home_controller.dart';
import 'package:e_commerce/Screens/product_view_screen/controller/product_controller.dart';
import 'package:e_commerce/Screens/product_view_screen/model/product_model.dart';
import 'package:e_commerce/Screens/product_view_screen/view/widget/bottom_navigator.dart';
import 'package:e_commerce/Screens/product_view_screen/view/widget/product_detail.dart';
import 'package:e_commerce/Screens/product_view_screen/view/widget/product_view_carousal.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ScreenProductView extends StatelessWidget {
  ScreenProductView({super.key});

  static String routeName = '/product_view.dart';

  final productC = Get.put(ProductController());

  List<String> sizes = [
    '35',
    '41',
    '44',
  ];

  @override
  Widget build(BuildContext context) {
    final homeC = Get.put(HomeContorller(context));
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final controlle = homeC.findById(productId);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
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
                Row(
                  children: [
                    Text(
                      controlle.description,
                      style: const TextStyle(
                        color: colorBlack,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
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
      bottomNavigationBar: ProductBottomNavigator(
        width: width,
        height: height,
      ),
    );
  }
}
