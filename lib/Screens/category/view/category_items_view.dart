import 'package:e_commerce/Screens/cart/controller/cart_controller.dart';
import 'package:e_commerce/Screens/category/model/enum_category_model.dart';
import 'package:e_commerce/Screens/home/controller/home_controller.dart';
import 'package:e_commerce/Screens/search_screen/view/search_view.dart';
import 'package:e_commerce/common/api/api_baseurl.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;

class ScreenCategoryItem extends StatelessWidget {
  ScreenCategoryItem({
    super.key,
    required this.height,
    required this.width,
    required this.selectCategoryScreen,
  });
  final double height;
  final double width;
  final cartC = Get.put(CartController());
  final CategoryScreenEnum selectCategoryScreen;
  final homecontroller = Get.put(HomeContorller());
  final apibaseurl = ApiBaseUrl();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
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
            selectCategoryScreen == CategoryScreenEnum.normalCategoryScreen
                ? Get.to(() => SearchScreen())
                : Get.back();
          },
          icon: Icon(
              selectCategoryScreen == CategoryScreenEnum.normalCategoryScreen
                  ? Icons.search
                  : Icons.arrow_back_rounded),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.04),
          child: const SizedBox(),
        ),
      ),
      body: SafeArea(
        child: GetBuilder<HomeContorller>(
          builder: (controller) => GridView.builder(
            padding: EdgeInsets.zero,
            // physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 1 / 1),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: width * 0.4,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(97, 214, 205, 205),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Container(
                          width: width * 0.4,
                          height: height * 0.17,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(
                                  '${apibaseurl.baseUrl}/category/${homecontroller.categoryList[index].image}'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        kHeight10,
                        Text(
                          homecontroller.categoryList[index].name,
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: homecontroller.categoryList.length,
          ),
        ),
      ),
    );
  }
}
