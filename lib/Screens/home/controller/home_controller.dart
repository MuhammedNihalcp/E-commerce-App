import 'dart:developer';

import 'package:e_commerce/Screens/category/model/category_model.dart';
import 'package:e_commerce/Screens/category/service/category_service.dart';
import 'package:e_commerce/Screens/home/model/carosual_model.dart';
import 'package:e_commerce/Screens/home/service/carousal_service.dart';
import 'package:e_commerce/Screens/product_view_screen/model/product_model.dart';
import 'package:e_commerce/Screens/product_view_screen/service/product_service.dart';
import 'package:e_commerce/Screens/product_view_screen/view/product_view.dart';
import 'package:get/get.dart';

class HomeContorller extends GetxController {
  HomeContorller(context) {
    getCategory(context);
    getProduct(context);
    getACarousal(context);
    log('homecontorller');
  }
  List<CategoryModel> categoryList = [];
  List<ProductModel> productList = [];
  List<CarousalModel> carousalList = [];

  bool isLoding = false;

  int activeIndex = 0;

  CategoryService categoryS = CategoryService();
  ProductService productS = ProductService();
  CarousalService carousalS = CarousalService();
  void getCategory(context) async {
    log('getcategory');
    isLoding = true;
    update();
    await categoryS.getCategory(context).then((value) {
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

  void getProduct(context) async {
    isLoding = true;
    update();
    await productS.getProduct(context).then((value) {
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

  void getACarousal(context) async {
    isLoding = true;
    update();
    await carousalS.getCarousal(context).then((value) {
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
  }

  void smoothIndicator(index) {
    activeIndex = index;
    update();
  }

  void toProdutScreen(index) {
    Get.toNamed(ScreenProductView.routeName, arguments: productList[index].id);
  }
}
