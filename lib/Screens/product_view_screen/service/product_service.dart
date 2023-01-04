import 'package:dio/dio.dart';
import 'package:e_commerce/Screens/product_view_screen/model/product_model.dart';
import 'package:e_commerce/common/api/api_baseurl.dart';
import 'package:e_commerce/common/api/api_endsurl.dart';
import 'package:e_commerce/util/dio_interceptor/dio_interceptor.dart';

class ProductService {
  final apibaseUrl = ApiBaseUrl();
  final apiendUrl = ApiEndsUrl();
  Future<List<ProductModel>?> getProduct(context) async {
    Dio dio = await ApiInterceptor().getApiUser(context);
    try {
      Response response = await dio.get(apibaseUrl.baseUrl+apiendUrl.)
    } catch (e) {}
  }
}
