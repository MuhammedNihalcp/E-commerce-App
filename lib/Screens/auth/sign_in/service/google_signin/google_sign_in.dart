import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/common/api/api_baseurl.dart';
import 'package:e_commerce/common/api/api_endsurl.dart';
import 'package:e_commerce/util/dio_exeption/exeptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  /*------------------- SignIn  with Google ----------------------*/
  Dio dio = Dio();
  final apibaseUrl = ApiBaseUrl();
  final apiendUrl = ApiEndsUrl();
  Future<String?> googleSignIn(GoogleSignIn googleSignIn) async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      log('google try');
      /*  call Signin Fuction   */
      final result = await googleSignIn.signIn();

      Response response = await dio.post(
        apibaseUrl.baseUrl + apiendUrl.google,
        data: jsonEncode(result),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final resultGoogle = response.data['message'];

        return resultGoogle;
      }

      log(result.toString());
    }
    /*  Catch error   */

   on DioError catch (e) {
      log(e.message, name: 'error google');
      DioException().dioError(e);
    }
    return null;
  }
}
