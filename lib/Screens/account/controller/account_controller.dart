import 'dart:developer';

import 'package:e_commerce/Screens/account/model/add_account_model.dart';
import 'package:e_commerce/Screens/account/model/enum_account.dart';
import 'package:e_commerce/Screens/account/model/get_account_model.dart';
import 'package:e_commerce/Screens/account/service/add_account_service.dart';

import 'package:e_commerce/Screens/auth/sign_in/view/signin_view.dart';
import 'package:e_commerce/Screens/navigator_screen/controller.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AcountController extends GetxController {
  final addressService = AddressService();

  AcountController() {
    getAllAddress();
  }

  final TextEditingController fullNameC = TextEditingController();
  final TextEditingController phoneC = TextEditingController();
  final TextEditingController pinC = TextEditingController();
  final TextEditingController stateC = TextEditingController();
  final TextEditingController placeC = TextEditingController();
  final TextEditingController addressC = TextEditingController();
  final TextEditingController landmarkC = TextEditingController();

  bool isLoading = false;
  bool isLoading2 = false;
  bool isSelected = true;
  bool isOfficeSelected = false;

  List<GetAddressModel> addressList = [];
  String addressType = 'Home';

  FlutterSecureStorage storage = const FlutterSecureStorage();
  final bottom = Get.put(LandingPageController());

  int selectIndex = 0;

  void addressSelect(int index) {
    selectIndex = index;
    update();
  }

  void addAccount() async {
    isLoading2 = true;
    update();

    final CreateAddressModel model = CreateAddressModel(
      title: addressType,
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

  void saveAddress(EnumAddress addressScreenCheck, String id) {
    if (addressScreenCheck == EnumAddress.addAddressScreen) {
      addAccount();
      update();
    } else {
      updateAddress(id);
      Get.back();
      getAllAddress();
      update();
    }
  }

  void setAddressScreen(
    EnumAddress addressScreenCheck,
    String? addressId,
  ) async {
    if (addressScreenCheck == EnumAddress.addAddressScreen) {
      clearAllControllers();
    } else {
      await AddressService().getSingleAddress(addressId!).then((value) {
        if (value != null) {
          fullNameC.text = value.fullName;
          phoneC.text = value.phone;
          pinC.text = value.pin;
          stateC.text = value.state;
          placeC.text = value.place;
          addressC.text = value.address;
          landmarkC.text = value.landMark;
          update();
          value.title == "Home" ? isSelected = true : isSelected = false;
          update();
        }
      });
    }
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
      title: addressType,
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
        isLoading2 = false;
        update();
        log('false');
      } else {
        isLoading2 = false;
        update();
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
    fullNameC.clear();
    phoneC.clear();
    pinC.clear();
    stateC.clear();
    placeC.clear();
    addressC.clear();
    landmarkC.clear();
  }

  void buttonSelection() {
    isSelected = !isSelected;
    update();
    isSelected == true ? addressType = 'Home' : addressType = 'Office';
    update();
  }

  String? fullNameValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please enter the username';
    } else if (value.length < 2) {
      return 'Too short username';
    } else {
      return null;
    }
  }

  String? mobileValdation(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your mobile number';
    } else if (value.length < 10) {
      return 'Invalid mobile number,make sure your entered 10 digits';
    } else {
      return null;
    }
  }

  String? pincodeValdation(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your PIN number';
    } else if (value.length < 6) {
      return 'Invalid Pin No';
    } else {
      return null;
    }
  }

  String? stateValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please enter the state';
    } else {
      return null;
    }
  }

  String? placeValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please enter the state';
    } else {
      return null;
    }
  }

  String? addressValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please enter the state';
    } else {
      return null;
    }
  }

  String? landmarkValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please enter the state';
    } else {
      return null;
    }
  }

  GetAddressModel findById(String id) {
    return addressList.firstWhere((element) => element.id == id);
  }
}
