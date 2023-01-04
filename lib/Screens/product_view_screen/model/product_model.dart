class ProductModel {
  final String id;
  final String name;
  final int price;
  final dynamic discountPrice;
  final int offer;
  final List<String> size;
  final List<String> image;
  final String category;
  final String rating;
  final String description;

  ProductModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.discountPrice,
      required this.offer,
      required this.size,
      required this.image,
      required this.category,
      required this.rating,
      required this.description});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      name: json['name'],
      price: json['price'],
      discountPrice: json['discountPrice'],
      offer: json['offer'],
      size: List<String>.from(json["size"].map((x) => x)),
      image: List<String>.from(json["image"].map((x) => x)),
      category: json['category'],
      rating: json['rating'],
      description: json["description"],
    );
  }
}
