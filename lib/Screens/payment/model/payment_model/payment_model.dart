class PaymentModel {
  final String itemCount;
  final String totalAmount;
  final List<String> productId;
  final String addressId;

  PaymentModel({
    required this.itemCount,
    required this.totalAmount,
    required this.productId,
    required this.addressId,
  });
}
