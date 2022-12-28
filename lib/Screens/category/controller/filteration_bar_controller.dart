import 'package:get/get.dart';

class FilterationBarController extends GetxController {
  int selFilterIndex = 0;

  void changeIndex(index) {
    selFilterIndex = index;
    update();
  }
}
