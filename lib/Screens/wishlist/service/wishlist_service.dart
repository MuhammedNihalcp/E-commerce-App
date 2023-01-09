import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/Screens/wishlist/model/wishlist_mode.dart';
import 'package:e_commerce/common/api/api_baseurl.dart';
import 'package:e_commerce/common/api/api_endsurl.dart';
import 'package:e_commerce/util/dio_exeption/exeptions.dart';
import 'package:e_commerce/util/dio_interceptor/dio_interceptor.dart';

class WishlistService {
  final apibaseUrl = ApiBaseUrl();
  final apiendUrl = ApiEndsUrl();
  Future<int?> addOrRemoveWishlist(context, productId) async {
    Dio dio = await ApiInterceptor().getApiUser(context);
    try {
      Response response =
          await dio.post(apibaseUrl.baseUrl + apiendUrl.wishlist, data: {
        'product': productId,
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.statusCode.toString(), name: 'wishlist 201');
        return response.statusCode;
      } else if (response.statusCode == 204) {
        log(response.statusCode.toString(), name: 'wishlist 204');
        return response.statusCode;
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e, context);
    }
    return null;
  }

  Future<WishlistModel?> getWishlist(context) async {
    Dio dio = await ApiInterceptor().getApiUser(context);
    try {
      Response response =
          await dio.get(apibaseUrl.baseUrl + apiendUrl.wishlist);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final WishlistModel wishModel = WishlistModel.fromJson(response.data);
        return wishModel;
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e, context);
    }
    return null;
  }
}
