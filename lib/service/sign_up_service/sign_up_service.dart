import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/Screens/sign_up/model/model.dart';
import 'package:e_commerce/Screens/sign_up/model/token_model.dart';
import 'package:e_commerce/common/api/api_baseurl.dart';
import 'package:e_commerce/common/api/api_endsurl.dart';
import 'package:flutter/widgets.dart';

class SignUpService {
  final dio = Dio();
  final abaseUrl = ApiBaseUrl();
  final aendUrl = ApiEndsUrl();

  Future<SignUpTokenModel?> signupUser(
      SignUpModel signupmodel, BuildContext context) async {
    log('response request');
    try {
      Response response = await dio.post(
        abaseUrl.baseUrl + aendUrl.signUp,
        data: jsonEncode(
          signupmodel.toJson(),
        ),
      );
      log('response statuscode');
      log(response.statusCode.toString());
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        final signupResponse = SignUpTokenModel.fromJson(response.data);
        log('response request');
        log(response.data.toString());
        return signupResponse;
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {}
    return null;
  }
}
