class GoogleModel {
  final String email;
  final String? name;

  GoogleModel({
    required this.email,
     this.name,
  });

  factory GoogleModel.fromJson(Map<String, dynamic> json) {
    return GoogleModel(
      email: json["email"] ?? '',
      name: json["name"] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "name": name,
    };
  }
}
