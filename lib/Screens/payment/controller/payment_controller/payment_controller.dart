import 'dart:developer';

import 'package:e_commerce/Screens/payment/model/order_model.dart';
import 'package:e_commerce/Screens/payment/service/order_service.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../order_placed/view/order_placed_screen.dart';

class PaymentController extends GetxController {
  Razorpay razorpay = Razorpay();
  List<Product> products = [];
  String? addressId;
  Map<String, dynamic> options = {};
  OrderService orderservice = OrderService();

  void setAddressId(String addressid) {
    addressId = addressid;
    update();
  }

  void setTotalAmount(amount, List<String> productIds, address) {
    final total = "${amount * 100}";
    final amountPayable = total.toString();
    openCheckout(amountPayable);
    products = productIds.map((e) => Product(id: e)).toList();
    addressId = address;
    update();
  }

  openCheckout(amountPayable) async {
    options = {
      'key': 'rzp_test_K1qY31Ub3PKsMs',
      'amount': amountPayable,
      'name': 'MY Shop',
      'description': 'Watch',
      'prefill': {'contact': '6238961357', 'email': 'Scotch@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      razorpay.open(options);
      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
          (PaymentSuccessResponse response) {
        handlePaymentSuccess(response);
        orderProducts(addressId!, 'ONLINE_PAYMENT');
        update();
      });
      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
          (PaymentFailureResponse response) {
        handlePaymentError(response);
      });
      razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
          (ExternalWalletResponse response) {
        handleExternalWallet(response);
      });
    } on PaymentFailureResponse catch (e) {
      log(e.error.toString());
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS:${response.paymentId}", timeInSecForIosWeb: 4);
    update();
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR:${response.code} - ${response.message}",
        timeInSecForIosWeb: 4);
    update();
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET:${response.walletName}", timeInSecForIosWeb: 4);
    update();
  }

  bool loading = false;
  Future<void> orderProducts(String addressId, paymentType) async {
    loading = true;
    update();
    final OrdersModel model = OrdersModel(
      addressId: addressId,
      paymentType: paymentType,
      products: products,
    );

    await orderservice.placeOrder(model).then((value) {
      if (value != null) {
        loading = false;
        update();
        Get.off(const OrderPlacedScreen());
      } else {
        loading = false;
        update();
      }
    });
  }
}
