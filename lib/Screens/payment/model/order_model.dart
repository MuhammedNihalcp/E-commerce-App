class OrdersModel {
  OrdersModel({
    required this.addressId,
    required this.paymentType,
    required this.products,
  });

  String addressId;
  String paymentType;
  List<Product> products;

  Map<String, dynamic> toJson() => {
        "addressId": addressId,
        "paymentType": paymentType,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    required this.id,
  });

  String id;

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
