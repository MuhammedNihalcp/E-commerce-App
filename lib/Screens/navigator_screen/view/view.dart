import 'package:e_commerce/Screens/account/view.dart';
import 'package:e_commerce/Screens/home/view.dart';
import 'package:e_commerce/Screens/navigator_screen/controller.dart';
import 'package:e_commerce/Screens/navigator_screen/view/widget.dart';
import 'package:e_commerce/Screens/order/view.dart';
import 'package:e_commerce/Screens/category/view.dart';
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
    final LandingPageController landingPageController =
        Get.put(LandingPageController());
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => IndexedStack(
            index: landingPageController.tapIndex.value,
            children: const [
              ScreenHome(),
              ScreenSearch(),
              ScreenOrder(),
              ScreenAccount(),
            ],
          ),
        ),
        bottomNavigationBar: Obx(
          (() => BottomNavigationBar(
                showUnselectedLabels: true,
                showSelectedLabels: true,
                onTap: ((index) => landingPageController.changeTabIndex(index)),
                currentIndex: landingPageController.tapIndex.value,
                backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
                unselectedItemColor: Colors.white.withOpacity(0.5),
                selectedItemColor: Colors.white,
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
                    backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(bottom: 7),
                      child: const Icon(
                        Icons.search,
                        size: 20.0,
                      ),
                    ),
                    label: 'Explore',
                    backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(bottom: 7),
                      child: const Icon(
                        Icons.shopping_cart,
                        size: 20.0,
                      ),
                    ),
                    label: 'Orders',
                    backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
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
                    backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
