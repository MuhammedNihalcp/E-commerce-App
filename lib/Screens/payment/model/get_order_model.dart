import 'package:e_commerce/Screens/product_view_screen/model/product_model.dart';

class GetOrderModel {
  GetOrderModel({
    required this.id,
    required this.userid,
    required this.products,
    required this.paymentType,
    required this.paymentStatus,
    required this.orderStatus,
    required this.fullName,
    required this.phone,
    required this.pin,
    required this.state,
    required this.place,
    required this.address,
    required this.landMark,
    required this.orderDate,
    required this.deliveryDate,
    required this.cancelDate,
    required this.totalPrice,
    required this.totalDiscount,
  });

  String id;
  String userid;
  List<ProductElement> products;
  String paymentType;
  bool paymentStatus;
  String orderStatus;
  String fullName;
  String phone;
  String pin;
  String state;
  String place;
  String address;
  String landMark;
  DateTime orderDate;
  DateTime deliveryDate;
  dynamic cancelDate;
  dynamic totalPrice;
  dynamic totalDiscount;

  factory GetOrderModel.fromJson(Map<String, dynamic> json) => GetOrderModel(
        id: json["_id"],
        userid: json["userid"],
        products: List<ProductElement>.from(
            json["products"].map((x) => ProductElement.fromJson(x))),
        paymentType: json["paymentType"],
        paymentStatus: json["paymentStatus"],
        orderStatus: json["orderStatus"],
        fullName: json["fullName"],
        phone: json["phone"],
        pin: json["pin"],
        state: json["state"],
        place: json["place"],
        address: json["address"],
        landMark: json["landMark"],
        orderDate: DateTime.parse(json["orderDate"]),
        deliveryDate: DateTime.parse(json["deliveryDate"]),
        cancelDate: json["cancelDate"],
        totalPrice: json["totalPrice"],
        totalDiscount: json["totalDiscount"],
      );
}

class ProductElement {
  ProductElement({
    required this.product,
    required this.qty,
    required this.price,
    required this.discountPrice,
    required this.size,
    required this.id,
  });

  ProductModel product;
  dynamic qty;
  dynamic price;
  dynamic discountPrice;
  String size;
  String id;

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        product: ProductModel.fromJson(json["product"]),
        qty: json["qty"],
        price: json["price"],
        discountPrice: json["discountPrice"],
        size: json["size"],
        id: json["_id"],
      );
}
