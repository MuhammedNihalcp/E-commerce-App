import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/util/dio_exeption/exeptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  /*------------------- SignIn  with Google ----------------------*/

  static Future<GoogleSignInAccount?> googleSignIn(
      GoogleSignIn googleSignIn) async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      log('google try');
      /*  call Signin Fuction   */
      final result = await googleSignIn.signIn();

      log(result.toString());
      return result;
    }
    /*  Catch error   */

    catch (e) {
      log(e.toString(), name: 'error google');
    }
    return null;
  }
}
