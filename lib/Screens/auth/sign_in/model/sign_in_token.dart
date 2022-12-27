class SigninTokenModel {
  final String accessToken;
  final String refreshToken;

  SigninTokenModel({required this.accessToken, required this.refreshToken});

  factory SigninTokenModel.fromJson(Map<String, dynamic> json) {
    return SigninTokenModel(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}