import 'dart:async';
import 'dart:developer';

import 'package:e_commerce/Screens/category/model/category_model.dart';
import 'package:e_commerce/Screens/category/service/category_service.dart';
import 'package:e_commerce/Screens/home/model/carosual_model.dart';
import 'package:e_commerce/Screens/home/service/carousal_service.dart';
import 'package:e_commerce/Screens/product_view_screen/model/product_model.dart';
import 'package:e_commerce/Screens/product_view_screen/service/product_service.dart';
import 'package:e_commerce/Screens/product_view_screen/view/product_view.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:get/get.dart';

class HomeContorller extends GetxController {
  HomeContorller() {
    getACarousal();
    getCategory();
    getProduct();

    log('homecontorller');
  }

  @override
  void onInit() {
    super.onInit();
    getConnectivity();
  }

  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  getConnectivity() => subscription = Connectivity()
          .onConnectivityChanged
          .listen((ConnectivityResult result) async {
        isDeviceConnected = await InternetConnectionChecker().hasConnection;
        if (!isDeviceConnected && isAlertSet == false) {
          showDialogBox();
          isAlertSet = true;
          update();
        }
      });

  @override
  void onClose() {
    subscription.cancel();
    super.onClose();
  }

  showDialogBox() => Get.defaultDialog(
        barrierDismissible: false,
        title: "No Connection",
        content: const Text(
          "Please check your internet connectivity",
          style: TextStyle(color: colorWhite),
        ),
        backgroundColor: colorBlack,
        titleStyle: const TextStyle(color: Colors.white),
        radius: 30,
        actions: [
          TextButton(
            onPressed: () async {
              Get.back();
              isAlertSet = false;
              update();
              isDeviceConnected =
                  await InternetConnectionChecker().hasConnection;
              if (!isDeviceConnected) {
                showDialogBox();
                isAlertSet = true;
                update();
              }
            },
            child: const Text('OK'),
          ),
        ],
      );

  List<CategoryModel> categoryList = [];
  List<ProductModel> productList = [];
  List<CarousalModel> carousalList = [];
  List<ProductModel> seachResult = [];

  bool isLoding = false;

  int activeIndex = 0;

  CategoryService categoryS = CategoryService();
  ProductService productS = ProductService();
  CarousalService carousalS = CarousalService();
  void getCategory() async {
    log('getcategory');
    isLoding = true;
    update();
    await categoryS.getCategory().then((value) {
      log('came category');
      if (value != null) {
        log('add category', name: 'category');
        categoryList = value;
        log(categoryList.toString(), name: 'categorylist');
        update();
        isLoding = false;
        update();
      } else {
        log('null value');
        isLoding = false;
        update();
        return null;
      }
    });
  }

  void getProduct() async {
    isLoding = true;
    update();
    await productS.getProduct().then((value) {
      if (value != null) {
        productList = value;
        update();
        isLoding = false;
        update();
      } else {
        isLoding = false;
        update();
        return null;
      }
    });
  }

  void getACarousal() async {
    isLoding = true;
    update();
    await carousalS.getCarousal().then((value) {
      if (value != null) {
        carousalList = value;
        update();
        isLoding = false;
        update();
      } else {
        isLoding = false;
        update();
      }
    });
    isLoding = false;
    update();
  }

  void smoothIndicator(index) {
    activeIndex = index;
    update();
  }

  ProductModel findById(String id) {
    return productList.firstWhere((element) => element.id == id);
  }

  List<ProductModel> findByCategoryId(String categoryId) {
    return productList
        .where((element) => element.category.contains(categoryId))
        .toList();
  }

  void toProdutScreen(index) {
    Get.toNamed(ScreenProductView.routeName, arguments: productList[index].id);
  }

  TextEditingController searchController = TextEditingController();
  void search(String keyboard) {
    List<ProductModel> results = [];
    if (keyboard.isEmpty) {
      results = productList;
      update();
    } else {
      results = productList
          .where(
            (element) => element.name.toLowerCase().contains(
                  keyboard.toLowerCase(),
                ),
          )
          .toList();
      update();
    }

    seachResult = results;
    update();
  }
}
