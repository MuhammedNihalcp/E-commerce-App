import 'package:e_commerce/Screens/cart/controller/cart_controller.dart';
import 'package:e_commerce/Screens/category/model/enum_category_model.dart';
import 'package:e_commerce/Screens/category/view/widget/category_product_view.dart';
import 'package:e_commerce/Screens/category/view/widget/filteration_bar.dart';
import 'package:e_commerce/Screens/home/controller/home_controller.dart';

import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:e_commerce/util/search_bar/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenCategory extends StatelessWidget {
  ScreenCategory({
    Key? key,
    required this.width,
    required this.height,
    required this.selectCategoryScreen,
    this.categoryId = '',
  }) : super(key: key);

  final double width;
  final double height;

  final cartC = Get.put(CartController());
  final homeC = Get.put(HomeContorller());
  static const routename = "/category_view.dart";
  final String categoryId;
  final CategoryScreenEnum selectCategoryScreen;

  @override
  Widget build(BuildContext context) {
    double width = Get.size.width;
    double height = Get.size.height;
    // final productId = ModalRoute.of(context)!.settings.arguments as String;
    final controllefind = homeC.findByCategoryId(categoryId);
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
                    FilerationBar(
                      width: width,
                    ),
                    kHeight20,
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            selectCategoryScreen ==
                                    CategoryScreenEnum.normalCategoryScreen
                                ? '${homeC.categoryList.length.toString()} Items'
                                : '${controllefind.length.toString()} Items',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // Text(
                        //   'sort by:',
                        // ),
                        // Text(
                        //   'Featured ⌄',
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                      ],
                    ),
                    kHeight20,
                    CategoryProductView(
                      controllers: controllefind,
                      homeCont: homeC,
                      width: width,
                      height: height,
                      selectedCategoryScreen: selectCategoryScreen,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
