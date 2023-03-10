import 'package:e_commerce/Screens/account/view/account_view.dart';
import 'package:e_commerce/Screens/category/view/category_items_view.dart';
import 'package:e_commerce/Screens/home/view/home_view.dart';
import 'package:e_commerce/Screens/navigator_screen/controller.dart';
import 'package:e_commerce/Screens/navigator_screen/view/widget.dart';
import 'package:e_commerce/Screens/category/model/enum_category_model.dart';
import 'package:e_commerce/Screens/category/view/category_view.dart';
import 'package:e_commerce/Screens/wishlist/view/wishlist_view.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ScreenNavigator extends StatelessWidget {
  ScreenNavigator({super.key});

  // final page = const [
  //   ScreenHome(),
  //   ScreenSearch(),
  //   ScreenOrder(),
  //   ScreenAccount(),
  // ];

  final bnm = BottomNavigationMenu();
  final LandingPageController landingPageController =
      Get.put(LandingPageController());

  @override
  Widget build(BuildContext context) {
    double height = Get.size.height;
    double width = Get.size.width;
    final LandingPageController landingPageController =
        Get.put(LandingPageController());
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => IndexedStack(
            index: landingPageController.tapIndex.value,
            children: [
              ScreenHome(
                width: width,
                height: height,
              ),
              ScreenCategoryItem(
                height: height,
                width: width,
                selectCategoryScreen: CategoryScreenEnum.normalCategoryScreen,
              ),
              // ScreenCategory(
              //   width: width,
              //   height: height,
              //   selectCategoryScreen: CategoryScreenEnum.normalCategoryScreen,
              // ),
              WishlistScreen(
                width: width,
                height: height,
              ),
              ScreenAccount(
                width: width,
                height: height,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Obx(
          (() => BottomNavigationBar(
                showUnselectedLabels: true,
                showSelectedLabels: true,
                onTap: ((index) => landingPageController.changeTabIndex(index)),
                currentIndex: landingPageController.tapIndex.value,
                backgroundColor: colorVailet,
                unselectedItemColor: Colors.white.withOpacity(0.5),
                selectedItemColor: colorWhite,
                unselectedLabelStyle: bnm.unselectedLabelStyle,
                selectedLabelStyle: bnm.selectedLabelStyle,
                items: [
                  BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(bottom: 7),
                      child: const Icon(
                        Icons.home,
                        size: 20.0,
                      ),
                    ),
                    label: 'Home',
                    backgroundColor: colorVailet,
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(bottom: 7),
                      child: const Icon(
                        Icons.grid_view_rounded,
                        size: 20.0,
                      ),
                    ),
                    label: 'Category',
                    backgroundColor: colorVailet,
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(bottom: 7),
                      child: const Icon(
                        Icons.favorite_border_sharp,
                        size: 20.0,
                      ),
                    ),
                    label: 'Wishlist',
                    backgroundColor: colorVailet,
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(bottom: 7),
                      child: const Icon(
                        Icons.account_circle,
                        size: 20.0,
                      ),
                    ),
                    label: 'Account',
                    backgroundColor: colorVailet,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
