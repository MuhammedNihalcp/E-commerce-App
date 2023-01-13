import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/Screens/auth/sign_in/model/sign_in_model.dart';
import 'package:e_commerce/Screens/auth/sign_in/model/sign_in_token.dart';
import 'package:e_commerce/common/api/api_baseurl.dart';
import 'package:e_commerce/common/api/api_endsurl.dart';
import 'package:e_commerce/util/dio_exeption/exeptions.dart';
import 'package:flutter/widgets.dart';

class SignInService {
  Dio dio = Dio();
  final apibaseUrl = ApiBaseUrl();
  final apiendUrl = ApiEndsUrl();
  SignInModel? signinModel;
  Future<SigninTokenModel?> signinUser(SignInModel model) async {
    try {
      Response response = await dio.post(
        apibaseUrl.baseUrl + apiendUrl.signIn,
        data: jsonEncode(
          model.toJson(),
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final signinModel = SigninTokenModel.fromJson(response.data);
        log(response.data.toString());

        return signinModel;
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e);
    }
    return null;
  }
}
