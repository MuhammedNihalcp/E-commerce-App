import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/Screens/home/model/carosual_model.dart';
import 'package:e_commerce/common/api/api_baseurl.dart';
import 'package:e_commerce/common/api/api_endsurl.dart';
import 'package:e_commerce/util/dio_exeption/exeptions.dart';
import 'package:e_commerce/util/dio_interceptor/dio_interceptor.dart';

class CarousalService {
  final apibaseUrl = ApiBaseUrl();
  final apiendUrl = ApiEndsUrl();
  Future<List<CarousalModel>?> getCarousal(context) async {
    Dio dio = await ApiInterceptor().getApiUser(context);
    try {
      Response response =
          await dio.get(apibaseUrl.baseUrl + apiendUrl.carousal);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        final List<CarousalModel> carousalList = (response.data as List)
            .map((e) => CarousalModel.fromJson(e))
            .toList();
        return carousalList;
      } else {
        return null;
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e, context);
    }
    return null;
  }
}
