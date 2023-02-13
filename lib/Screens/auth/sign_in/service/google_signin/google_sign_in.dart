import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/Screens/auth/sign_in/model/google_model/google_model.dart';
import 'package:e_commerce/common/api/api_baseurl.dart';
import 'package:e_commerce/common/api/api_endsurl.dart';
import 'package:e_commerce/util/dio_exeption/exeptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  /*------------------- SignIn  with Google ----------------------*/
  Dio dio = Dio();
  final apibaseUrl = ApiBaseUrl();
  final apiendUrl = ApiEndsUrl();
  Future<String?> googleSignIn(GoogleModel model) async {
    // GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      log('google try');
      /*  call Signin Fuction   */
      

      Response response = await dio.post(
        apibaseUrl.baseUrl + apiendUrl.google,
        data: jsonEncode(model),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final resultGoogle = response.data['message'];

        return resultGoogle;
      }

      log('google login ayi');
    }
    /*  Catch error   */

   on DioError catch (e) {
      log(e.message, name: 'error google');
      DioException().dioError(e);
    }
    return null;
  }
}
