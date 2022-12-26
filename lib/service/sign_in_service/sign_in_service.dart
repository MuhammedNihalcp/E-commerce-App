import 'package:dio/dio.dart';
import 'package:e_commerce/Screens/sign_in/model/sign_in_model.dart';

class SignInService{
  Dio dio = Dio();
  SignInModel? signinModel;
  Future<SigninTokenModel?> signinUser(
      SigninModel model, BuildContext context) async {
    try {
      Response response = await dio.post(
        ApiBaseUrl().baseUrl + ApiEndpoints.signIn,
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
      DioException().dioError(e, context);
    }
    return null;
  }
}