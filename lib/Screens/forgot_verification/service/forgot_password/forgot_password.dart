import 'package:dio/dio.dart';
import 'package:e_commerce/common/api/api_baseurl.dart';
import 'package:e_commerce/common/api/api_endsurl.dart';
import 'package:e_commerce/util/dio_exeption/exeptions.dart';
import 'package:flutter/widgets.dart';

class ForgetPasswordServices {
  static Future<String?> getOtp(String email, BuildContext context) async {
    try {
      Dio dio = Dio();
      final apibaseUrl = ApiBaseUrl();
      final apiendUrl = ApiEndsUrl();
      Response response = await dio.post(
        apibaseUrl.baseUrl + apiendUrl.forgot,
        data: {
          "email": email,
        },
        //  options: Options(headers: AppConfig.getApiHeader(token: null)),
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return response.data["message"];
      }
    } on DioError catch (e) {
      DioException().dioError(e, context);
    }
    return null;
  }
}
