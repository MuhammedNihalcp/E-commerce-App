import 'package:get/get.dart';

class LandingPageController extends GetxController {
  var tapIndex = 0.obs;

  void changeTabIndex(int index) {
    tapIndex.value = index;
  }
  void gotoHomescreen() {
    tapIndex = 0.obs;
    
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
