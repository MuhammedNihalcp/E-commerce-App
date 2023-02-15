import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/Screens/payment/model/get_order_model.dart';
import 'package:e_commerce/Screens/payment/model/order_model.dart';
import 'package:e_commerce/common/api/api_baseurl.dart';
import 'package:e_commerce/common/api/api_endsurl.dart';
import 'package:e_commerce/util/dio_exeption/exeptions.dart';
import 'package:e_commerce/util/dio_interceptor/dio_interceptor.dart';

class OrderService {
  ApiBaseUrl apibaseUrl = ApiBaseUrl();
  ApiEndsUrl apiendUrl = ApiEndsUrl();
  Future<String?> placeOrder(OrdersModel model) async {
    final Dio dios = await ApiInterceptor().getApiUser();

    try {
      final Response response = await dios.post(
        apibaseUrl.baseUrl + apiendUrl.orders,
        data: model.toJson(),
      );
      if (response.statusCode == 201) {
        if (response.data == null) {
          return null;
        } else {
          final GetOrderModel order =
              GetOrderModel.fromJson(response.data['order']);
          log(order.toString());
          return order.id;
        }
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      DioException().dioError(e);
    }
    return null;
  }

  Future<List<GetOrderModel>?> getAllOrders() async {
    Dio dios = await ApiInterceptor().getApiUser();
    try {
      final Response response = await dios.get(
        apibaseUrl.baseUrl + apiendUrl.orders,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data == null) {
          return null;
        } else {
          final List<GetOrderModel> model = (response.data as List)
              .map((e) => GetOrderModel.fromJson(e))
              .toList();

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

  Future<GetOrderModel?> getSingleOrders(String orderId) async {
    Dio dios = await ApiInterceptor().getApiUser();
    try {
      final Response response = await dios.get(
        "${apibaseUrl.baseUrl + apiendUrl.orders}/$orderId",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data == null) {
          return null;
        } else {
          final GetOrderModel model = GetOrderModel.fromJson(response.data);

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

  Future<String?> cancelOrder(orderId) async {
    try {
      final Dio dios = await ApiInterceptor().getApiUser();
      final Response response = await dios.patch(
        "${apibaseUrl.baseUrl + apiendUrl.orders}/$orderId",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data == null) {
          return null;
        } else {
          final order = response.data['message'];
          log(order.toString());
          return order;
        }
      } else {
        return null;
      }
    } on DioError catch (e) {
      log(e.message.toString());
      DioException().dioError(e);
    }
    return null;
  }
}
