import 'package:e_commerce/Screens/cart/controller/cart_controller.dart';
import 'package:e_commerce/Screens/category/view/widget/filteration_bar.dart';
import 'package:e_commerce/Screens/home/controller/home_controller.dart';
import 'package:e_commerce/Screens/home/view/widget/grid_view.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:e_commerce/util/search_bar/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenCategory extends StatelessWidget {
  ScreenCategory({Key? key, required this.width, required this.height})
      : super(key: key);

  final double width;
  final double height;

  final cartC = Get.put(CartController());
  final homeC = Get.put(HomeContorller());

  @override
  Widget build(BuildContext context) {
    double width = Get.size.width;
    double height = Get.size.height;
    return Scaffold(
        backgroundColor: backgroundColor,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                cartC.goToCartFromProduct();
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: colorWhite,
              ),
            ),
          ],
          backgroundColor: colorVailet,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Category',
                style: TextStyle(
                  letterSpacing: 3,
                  color: colorWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(height * 0.04),
            child: const SizedBox(),
          ),
        ),
        body: homeC.isLoding == true
            ? const Center(
                child: CircularProgressIndicator(
                  color: colorWhite,
                  backgroundColor: colorVailet,
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.12,
                      ),
                      SearchBar(
                        width: width,
                        height: height,
                      ),
                      kHeight10,
                      FilerationBar(width: width),
                      kHeight20,
                      Row(
                        children: const [
                          Expanded(
                            child: Text(
                              '166 Items',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text('sort by:'),
                          Text(
                            'Featured ⌄',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      kHeight20,
                      ProductGridView(
                        width: width,
                        height: height,
                      ),
                    ],
                  ),
                ),
              ));
  }
}
