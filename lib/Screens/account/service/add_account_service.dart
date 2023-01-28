import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/Screens/account/model/add_account_model.dart';
import 'package:e_commerce/Screens/account/model/get_account_model.dart';
import 'package:e_commerce/common/api/api_baseurl.dart';
import 'package:e_commerce/common/api/api_endsurl.dart';
import 'package:e_commerce/util/dio_exeption/exeptions.dart';
import 'package:e_commerce/util/dio_interceptor/dio_interceptor.dart';

class AddressService {
  final apibaseUrl = ApiBaseUrl();
  final apiendUrl = ApiEndsUrl();
  Future<String?> addAddress(CreateAddressModel model) async {
    Dio dios = await ApiInterceptor().getApiUser();
    try {
      log('try');
      final Response response = await dios.post(
        apibaseUrl.baseUrl + apiendUrl.address,
        data: model.toJson(),
      );
      log('response');

      if (response.statusCode == 201) {
        if (response.data == null) {
          return null;
        } else {
          final String result = response.data['message'];
          log(result.toString(),name: 'add');
          return result;
        }
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e);
    }
    return null;
  }

  Future<List<GetAddressModel>?> getAddress() async {
    Dio dios = await ApiInterceptor().getApiUser();
    try {
      final Response response = await dios.get(
        apibaseUrl.baseUrl + apiendUrl.address,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data == null) {
          return null;
        } else {
          final List<GetAddressModel> model = (response.data as List)
              .map((e) => GetAddressModel.fromJson(e))
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

  Future<String?> updateAddress(
      CreateAddressModel model, String addressId) async {
    Dio dios = await ApiInterceptor().getApiUser();
    try {
      log('try');
      final Response response = await dios.patch(
        "${apibaseUrl.baseUrl + apiendUrl.address}/$addressId",
        data: model.toJson(),
      );
      log('response');

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data == null) {
          return null;
        } else {
          final String result = response.data['message'];
          log(result.toString());
          return result;
        }
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e);
    }
    return null;
  }

  Future<String?> deleteAddress(String addressId) async {
    Dio dios = await ApiInterceptor().getApiUser();
    try {
      log('try');
      final Response response = await dios.delete(
        "${apibaseUrl.baseUrl + apiendUrl.address}/$addressId",
      );
      log('response');

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data == null) {
          return null;
        } else {
          final String result = response.data['message'];
          log(result.toString());
          return result;
        }
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e);
    }
    return null;
  }
}
