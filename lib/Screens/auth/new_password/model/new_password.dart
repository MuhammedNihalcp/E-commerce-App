class NewPasswordModel {
  final String email;
  final String password;

  NewPasswordModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }

  factory NewPasswordModel.fromJson(Map<String, dynamic> json) {
    return NewPasswordModel(
      email: json["email"],
      password: json["password"],
    );
  }
}
