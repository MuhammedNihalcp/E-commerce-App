import 'package:e_commerce/Screens/cart/controller/cart_controller.dart';
import 'package:e_commerce/Screens/category/model/enum_category_model.dart';
import 'package:e_commerce/Screens/category/view/widget/category_product_view.dart';

import 'package:e_commerce/Screens/home/controller/home_controller.dart';
import 'package:e_commerce/Screens/search_screen/view/search_view.dart';

import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;

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
          GetBuilder<CartController>(
            builder: (controller) => badges.Badge(
              position: badges.BadgePosition.topEnd(top: 1, end: 2),
              badgeContent: Text(
                cartC.totalproductCount.toString(),
                style: const TextStyle(
                  color: colorWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: IconButton(
                onPressed: () {
                  cartC.goToCartFromProduct();
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  color: colorWhite,
                ),
              ),
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
        leading: IconButton(
          onPressed: () {
            Get.to(() => SearchScreen());
          },
          icon: const Icon(Icons.search),
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
                    kHeight20,
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            selectCategoryScreen ==
                                    CategoryScreenEnum.normalCategoryScreen
                                ? '${homeC.categoryList.length + 1} Items'
                                : '${controllefind.length} Items',
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
