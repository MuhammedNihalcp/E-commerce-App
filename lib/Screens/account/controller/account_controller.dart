import 'dart:developer';

import 'package:e_commerce/Screens/account/model/add_account_model.dart';
import 'package:e_commerce/Screens/account/service/add_account_service.dart';
import 'package:e_commerce/Screens/auth/sign_in/view/signin_view.dart';
import 'package:e_commerce/Screens/navigator_screen/controller.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AcountController extends GetxController {

  final addressService = AddressService();


  final TextEditingController tittleC = TextEditingController();
  final TextEditingController fullNameC = TextEditingController();
  final TextEditingController phoneC = TextEditingController();
  final TextEditingController pinC = TextEditingController();
  final TextEditingController stateC = TextEditingController();
  final TextEditingController placeC = TextEditingController();
  final TextEditingController addressC = TextEditingController();
  final TextEditingController landmarkC = TextEditingController();

  bool isLoading = false;
  bool isLoading2 = false;

  FlutterSecureStorage storage = const FlutterSecureStorage();
  final bottom = Get.put(LandingPageController());

  void addAccount() async {
    isLoading2 = true;
    update();

    final CreateAddressModel model = CreateAddressModel(
      title: tittleC.text.trim(),
      fullName: fullNameC.text.trim(),
      phone: phoneC.text.trim(),
      pin: pinC.text.trim(),
      state: stateC.text.trim(),
      place: placeC.text.trim(),
      address: addressC.text.trim(),
      landMark: landmarkC.text.trim(),
    );

    await addressService.addAddress(model).then((value) {
      if(value!=null){
        log('hai');
        clearAllControllers();
        Get.back();
        isLoading2 = false;
        update();
      }
    });
  }

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

  void clearAllControllers(){
    tittleC.clear();
    fullNameC.clear();
    phoneC.clear();
    pinC.clear();
    stateC.clear();
    placeC.clear();
    addressC.clear();
    landmarkC.clear();
  }
}
