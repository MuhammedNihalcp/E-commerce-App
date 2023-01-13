import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/Screens/cart/model/add_cart_model.dart';
import 'package:e_commerce/Screens/cart/model/get_cart_model.dart';
import 'package:e_commerce/common/api/api_baseurl.dart';
import 'package:e_commerce/common/api/api_endsurl.dart';
import 'package:e_commerce/util/dio_exeption/exeptions.dart';
import 'package:e_commerce/util/dio_interceptor/dio_interceptor.dart';

class CartService {
  final apibaseUrl = ApiBaseUrl();
  final apiendUrl = ApiEndsUrl();
  Future<String?> addToCart(AddCartModel model, ) async {
    Dio dio = await ApiInterceptor().getApiUser();
    try {
      Response response = await dio.post(apibaseUrl.baseUrl + apiendUrl.cart,
          data: jsonEncode(model.toJson()));
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data == null) {
          return null;
        } else {
          final cartResponse = response.data['message'];
          return cartResponse;
        }
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e);
    }
    return null;
  }

  Future<GetCartModel?> getCart() async {
    Dio dio = await ApiInterceptor().getApiUser();

    try {
      Response response = await dio.get(apibaseUrl.baseUrl + apiendUrl.cart);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data == null) {
          return null;
        } else {
          final GetCartModel model = GetCartModel.fromJson(response.data);
          log(response.data.toString());
          return model;
        }
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e);
    }
    return null;
  }

  Future<String?> removeFromCart( String id) async {
    Dio dio = await ApiInterceptor().getApiUser();
    try {
      Response responce = await dio
          .patch(apibaseUrl.baseUrl + apiendUrl.cart, data: {"product": id});
      if (responce.statusCode == 200 || responce.statusCode == 201) {
        final cartRemove = responce.data['message'];
        return cartRemove;
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e);
    }
    return null;    
  }
}
