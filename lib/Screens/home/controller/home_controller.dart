import 'dart:developer';

import 'package:e_commerce/Screens/category/model/category_model.dart';
import 'package:e_commerce/Screens/category/service/category_service.dart';
import 'package:e_commerce/Screens/product_view_screen/model/product_model.dart';
import 'package:get/get.dart';

class HomeContorller extends GetxController {
  HomeContorller(context) {
    getCategory(context);
    log('homecontorller');
  }
  List<CategoryModel> categoryList = [];
   List<ProductModel> productList = [];

  bool isLoding = false;

  CategoryService categoryS = CategoryService();
  void getCategory(context) async {
    log('getcategory');
    isLoding = true;
    update();
    await categoryS.getCategory(context).then((value) {
      log('came category');
      if (value != null) {
        log('add category',name: 'category');
        categoryList = value;
        log(categoryList.toString(),name: 'categorylist');
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
    await product.homeProducts(context).then((value) {
      if (value != null) {
        productList = value;
        notifyListeners();
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
        return null;
      }
    });
  }
}
