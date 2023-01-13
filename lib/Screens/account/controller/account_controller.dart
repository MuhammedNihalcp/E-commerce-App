import 'package:e_commerce/Screens/auth/sign_in/view/signin_view.dart';
import 'package:e_commerce/Screens/navigator_screen/controller.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AcountController extends GetxController {
  bool isLoading = false;
  FlutterSecureStorage storage = const FlutterSecureStorage();
  final bottom = Get.put(LandingPageController());
  void logout() async {
    isLoading = true;
    update();
    await storage.delete(key: 'token');
    await storage.delete(key: 'refreshToken');

    Get.offAll(() => ScreenLogin());
    bottom.tapIndex = 0.obs;
    isLoading = false;
    update();
  }
}
