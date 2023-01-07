import 'dart:developer';

import 'package:get/get.dart';

class ProductController extends GetxController {
  int activeSize = 0;

  int activeCarousal = 0;

  void onSizeSelected(index) {
    log('select size', name: 'size select');
    activeSize = index;
    update();
    log('update size', name: 'size update');
  }

  void changeCarousalPosition(index) {
    activeCarousal = index;
    update();
  }

  void goBackHome(context) {
    Get.back();
    activeCarousal = 0;
    update();
  }
}
