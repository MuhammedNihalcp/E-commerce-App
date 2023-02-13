import 'package:e_commerce/Screens/cart/controller/cart_controller.dart';

import 'package:e_commerce/Screens/category/view/category_view.dart';
import 'package:e_commerce/Screens/home/controller/home_controller.dart';
import 'package:e_commerce/Screens/home/view/widget/carousel_view.dart';
import 'package:e_commerce/Screens/home/view/widget/category_items.dart';
import 'package:e_commerce/Screens/home/view/widget/grid_view.dart';
import 'package:e_commerce/Screens/payment/view/order_summery/order_summery.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:e_commerce/util/cricularProgressWidget/circular_progress_widget.dart';
import 'package:e_commerce/util/search_bar/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ScreenHome extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var options;

  ScreenHome({Key? key, required this.width, required this.height})
      : super(key: key);

  final double width;
  final double height;

  final cartC = Get.put(CartController());

  final homeC = Get.put(HomeContorller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: colorVailet,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'My',
              style: TextStyle(
                letterSpacing: 3,
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Shop',
              style: TextStyle(
                letterSpacing: 3,
                fontWeight: FontWeight.bold,
                color: colorBlack,
              ),
            )
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Get.to(
              () => ScreenOrderSummery(
                height: height,
                width: width,
              ),
            );
          },
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {
              cartC.goToCartFromProduct();
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.04),
          child: const SizedBox(),
        ),
      ),
      body: GetBuilder<HomeContorller>(
        builder: (controller) => homeC.isLoding == true
            ? const CircularProgressWidget()
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.12,
                      ),
                      SearchBar(width: width, height: height),
                      kHeight10,
                      CarouselWidget(
                        height: height,
                        width: width,
                        controller: homeC,
                      ),
                      kHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Category',
                            style: TextStyle(
                              color: colorBlack,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.to(
                                () => ScreenCategory(
                                  width: width,
                                  height: height,
                                ),
                              );
                            },
                            child: const Text(
                              'See All >',
                              style: TextStyle(color: colorBlack),
                            ),
                          )
                        ],
                      ),
                      HomePageCategoryItems(
                        height: height,
                        controllers: homeC,
                      ),
                      kHeight10,
                      Row(
                        children: const [
                          Text(
                            'Featured',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      kHeight10,
                      ProductGridView(
                        width: width,
                        height: height,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}


