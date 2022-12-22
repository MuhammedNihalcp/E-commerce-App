import 'package:e_commerce/Screens/account/view.dart';
import 'package:e_commerce/Screens/home/view.dart';
import 'package:e_commerce/Screens/navigator_screen/controller.dart';
import 'package:e_commerce/Screens/navigator_screen/view/widget.dart';
import 'package:e_commerce/Screens/order/view.dart';
import 'package:e_commerce/Screens/search/view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ScreenNavigator extends StatelessWidget {
  ScreenNavigator({super.key});

  final bnm = BottomNavigationMenu();

  final LandingPageController landingPageController =
      Get.put(LandingPageController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          bnm.buildBottomNavigationMenu(context, landingPageController),
      body: Obx(() => IndexedStack(
            index: landingPageController.tapIndex.value,
            children: const[
              ScreenHome(),
              ScreenSearch(),
              ScreenOrder(),
              ScreenAccount(),
            ],
          )),
    );
  }
}
