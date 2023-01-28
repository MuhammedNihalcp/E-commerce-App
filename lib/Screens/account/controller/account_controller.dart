import 'dart:developer';

import 'package:e_commerce/Screens/account/model/add_account_model.dart';
import 'package:e_commerce/Screens/account/model/get_account_model.dart';
import 'package:e_commerce/Screens/account/service/add_account_service.dart';
import 'package:e_commerce/Screens/account_setting/view/account_setting.dart';
import 'package:e_commerce/Screens/auth/sign_in/view/signin_view.dart';
import 'package:e_commerce/Screens/navigator_screen/controller.dart';
import 'package:e_commerce/core/text_style.dart';
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

  List<GetAddressModel> addressList = [];

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
      if (value != null) {
        log('add account', name: 'add accoutn');
        clearAllControllers();
        Get.back();
        isLoading2 = false;
        update();
      } else {
        isLoading2 = false;
        update();
      }
    });
    return null;
  }

  void saveAddress() {
    addAccount();
    update();
  }

  Future<String?> getAllAddress() async {
    isLoading = true;
    update();
    await AddressService().getAddress().then((value) {
      if (value != null) {
        log(value.toString());
        addressList = value;
        update();
        isLoading = false;
        update();
        return 'Done';
      } else {
        isLoading = false;
        update();
        return null;
      }
    });
    return null;
  }

  void updateAddress(String addressId) async {
    isLoading2 = true;
    update();
    final CreateAddressModel model = CreateAddressModel(
      title: tittleC.text,
      fullName: fullNameC.text,
      phone: phoneC.text,
      pin: pinC.text,
      state: stateC.text,
      place: placeC.text,
      address: addressC.text,
      landMark: landmarkC.text,
    );
    await addressService.updateAddress(model, addressId).then((value) {
      if (value != null) {
        clearAllControllers();
        Get.back();
        isLoading2 = false;
        update();
      } else {
        isLoading2 = false;
        update();
      }
    });
    return null;
  }

  void deleteAddress(String addressId) async {
    log('delete function entered');
    isLoading2 = true;
    update();
    await AddressService().deleteAddress(addressId).then((value) {
      if (value != null) {
        getAllAddress();
        Get.back();
        Get.snackbar(
          "Delete",
          "Address removed successfully",
          colorText: colorremoveSnack,
        );

        update();
      } else {
        return null;
      }
    });
    isLoading = false;
    update();
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

  void clearAllControllers() {
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
