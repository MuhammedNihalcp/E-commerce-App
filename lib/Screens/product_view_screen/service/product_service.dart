import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/Screens/product_view_screen/model/product_model.dart';
import 'package:e_commerce/common/api/api_baseurl.dart';
import 'package:e_commerce/common/api/api_endsurl.dart';
import 'package:e_commerce/util/dio_exeption/exeptions.dart';
import 'package:e_commerce/util/dio_interceptor/dio_interceptor.dart';

class ProductService {
  final apibaseUrl = ApiBaseUrl();
  final apiendUrl = ApiEndsUrl();
  Future<List<ProductModel>?> getProduct(context) async {
    Dio dio = await ApiInterceptor().getApiUser(context);
    try {
      Response response = await dio.get(apibaseUrl.baseUrl + apiendUrl.product);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.statusCode.toString(), name: 'product statuscode');
        log(response.data.toString());
        final List<ProductModel> productList = (response.data as List)
            .map((e) => ProductModel.fromJson(e))
            .toList();

        return productList;
      } else {
        return null;
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e, context);
    }
    return null;
  }
}
