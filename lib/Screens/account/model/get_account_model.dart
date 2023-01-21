class GetAddressModel {
  final String id;
  final String user;
  final String title;
  final String fullName;
  final String phone;
  final String pin;
  final String state;
  final String place;
  final String address;
  final String landMark;

  GetAddressModel({
    required this.id,
    required this.user,
    required this.title,
    required this.fullName,
    required this.phone,
    required this.pin,
    required this.state,
    required this.place,
    required this.address,
    required this.landMark,
  });

  factory GetAddressModel.fromJson(Map<String, dynamic> json) {
    return GetAddressModel(
      id: json["_id"],
      user: json["user"],
      title: json["title"],
      fullName: json["fullName"],
      phone: json["phone"],
      pin: json["pin"],
      state: json["state"],
      place: json["place"],
      address: json["address"],
      landMark: json["landMark"],
    );
  }
}
