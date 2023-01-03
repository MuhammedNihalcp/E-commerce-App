import 'package:e_commerce/Screens/category/model/category_model.dart';
import 'package:e_commerce/Screens/category/service/category_service.dart';
import 'package:get/get.dart';

class HomeContorller extends GetxController {
  List<CategoryModel> categoryList = [];

  bool isLoding = false;

  CategoryService categoryS = CategoryService();
  void getCategory(context) async {
    isLoding = true;
    update();
    await categoryS.getCategory(context).then((value) {
      if (value != null) {
        categoryList = value;
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
}
