import 'package:e_commerce/Screens/product_view_screen/model/product_model.dart';

class GetCartModel {
  GetCartModel({
    required this.id,
    required this.userId,
    required this.products,
    required this.totalPrice,
    required this.totalDiscount,
  });
  String id;
  String userId;
  List<ProductElement> products;
  int totalPrice;
  dynamic totalDiscount;

  factory GetCartModel.fromJson(Map<String, dynamic> json) => GetCartModel(
        id: json["_id"],
        userId: json["userid"],
        products: List<ProductElement>.from(
            json["products"].map((x) => ProductElement.fromJson(x))),
        totalPrice: json["totalPrice"],
        totalDiscount: json["totalDiscount"],
      );
}

class ProductElement {
  ProductElement({
    required this.product,
    required this.size,
    required this.qty,
    required this.price,
    required this.discountPrice,
    required this.id,
  });

  ProductModel product;
  String size;
  int qty;
  int price;
  dynamic discountPrice;
  String id;

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        product: ProductModel.fromJson(json["product"]),
        size: json["size"],
        qty: json["qty"],
        price: json["price"],
        discountPrice: json["discountPrice"],
        id: json["_id"],
      );
}
