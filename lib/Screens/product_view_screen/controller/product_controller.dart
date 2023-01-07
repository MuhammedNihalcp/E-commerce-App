import 'dart:developer';

import 'package:get/get.dart';

class ProductController extends GetxController {
  int activeSize = 0;

  void onSizeSelected(index) {
    log('select size', name: 'size select');
    activeSize = index;
    update();
    log('update size', name: 'size update');
  }

  var tapIndex = 0.obs;

  void changeTabIndex(int index) {
    tapIndex.value = index;
  }
}
