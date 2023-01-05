class CarousalModel {
  final String id;
  final String image;
  final String offer;

  CarousalModel({
    required this.id,
    required this.image,
    required this.offer,
  });
  factory CarousalModel.fromJson(Map<String, dynamic> json) {
    return CarousalModel(
      id: json['_id'],
      image: json['image'],
      offer: json['offer'],
    );
  }
}
