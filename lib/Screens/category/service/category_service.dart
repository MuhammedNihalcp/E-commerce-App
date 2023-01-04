import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/Screens/category/model/category_model.dart';
import 'package:e_commerce/util/dio_exeption/exeptions.dart';

import '../../../common/api/api_baseurl.dart';
import '../../../common/api/api_endsurl.dart';
import '../../../util/dio_interceptor/dio_interceptor.dart';


class CategoryService {
  final apibaseUrl = ApiBaseUrl();
  final apiendUrl = ApiEndsUrl();

  Future<List<CategoryModel>?> getCategory(context) async {
    log('came service');
    Dio dio = await ApiInterceptor().getApiUser(context);
    try {
      Response response =
          await dio.get(apibaseUrl.baseUrl + apiendUrl.category);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString(),name: 'responce');
        final List<CategoryModel> listCategory = (response.data as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList();
        log('set category');

        return listCategory;
      } else {
        return null;
      }
    } on DioError catch (e) {
      // log(e.message);
      DioException().dioError(e, context);
    }
    return null;
  }
}
