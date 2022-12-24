class SignUpModel {
  final String fullname;
  final String email;
  final String phone;
  final String password;

  SignUpModel({
    required this.fullname,
    required this.email,
    required this.phone,
    required this.password,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      fullname: json["fullname"] ?? '',
      email: json["email"] ?? '',
      phone: json["phone"] ?? '',
      password: json["password"] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "fullname": fullname,
      "email": email,
      "phone": phone,
      "password": password
    };
  }
}
