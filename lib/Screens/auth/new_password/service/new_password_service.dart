import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/Screens/auth/new_password/model/new_password.dart';
import 'package:e_commerce/common/api/api_baseurl.dart';
import 'package:e_commerce/common/api/api_endsurl.dart';
import 'package:e_commerce/util/dio_exeption/exeptions.dart';

class NewPasswordService {
  Dio dio = Dio();
  final apibaseUrl = ApiBaseUrl();
  final apiendUrl = ApiEndsUrl();
  Future<String?> addNewPassword(NewPasswordModel passwordModel) async {
    try {
      Response response = await dio.post(
        apibaseUrl.baseUrl + apiendUrl.forgot,
        data: jsonEncode(passwordModel.toJson()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log('newpassword responce');
        final result = response.data['message'];
        return result;
      }
    } on DioError catch (e) {
      log(e.message.toString());
      DioException().dioError(e);
    }
    return null;
  }
}
