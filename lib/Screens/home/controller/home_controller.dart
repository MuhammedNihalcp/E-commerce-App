import 'dart:developer';

import 'package:e_commerce/Screens/category/model/category_model.dart';
import 'package:e_commerce/Screens/category/service/category_service.dart';
import 'package:e_commerce/Screens/home/model/carosual_model.dart';
import 'package:e_commerce/Screens/home/service/carousal_service.dart';
import 'package:e_commerce/Screens/product_view_screen/model/product_model.dart';
import 'package:e_commerce/Screens/product_view_screen/service/product_service.dart';
import 'package:e_commerce/Screens/product_view_screen/view/product_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeContorller extends GetxController {
  HomeContorller() {
    getCategory();
    getProduct();
    getACarousal();
    log('homecontorller');
  }
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
    } else {
      results = productList
          .where(
            (element) => element.name.toLowerCase().contains(
                  keyboard.toLowerCase(),
                ),
          )
          .toList();
    }

    seachResult = results;
    update();
  }
}
