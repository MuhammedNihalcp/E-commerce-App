import 'package:e_commerce/Screens/sign_up/model/model.dart';
import 'package:e_commerce/Screens/verification_code_screen/model/otp_enum.dart';

class OtpModel {
  final SignUpModel model;
  final OtpEnum screenCheck;

  OtpModel({
    required this.model,
    required this.screenCheck,
  });
}