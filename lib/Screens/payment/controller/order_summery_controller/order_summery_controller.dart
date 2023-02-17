import 'dart:developer';

import 'package:e_commerce/Screens/account/model/get_account_model.dart';
import 'package:e_commerce/Screens/account/service/add_account_service.dart';
import 'package:e_commerce/Screens/cart/model/get_single_cart_model.dart';
import 'package:e_commerce/Screens/cart/service/cart_service.dart';
import 'package:e_commerce/Screens/payment/controller/payment_controller/payment_controller.dart';
import 'package:e_commerce/Screens/payment/model/get_order_model.dart';
import 'package:e_commerce/Screens/payment/model/order_enum.dart';
import 'package:e_commerce/Screens/payment/service/order_service.dart';
import 'package:e_commerce/Screens/payment/view/order_summery/order_summery.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderSummeryController extends GetxController {
  PaymentController paymentcontroller = PaymentController();
  OrderSummeryController() {
    startLoading();
    getAllOrders();
  }
  @override
  void onInit() {
    final razorpay = paymentcontroller.razorpay;
    razorpay.on(
        Razorpay.EVENT_PAYMENT_SUCCESS, paymentcontroller.handlePaymentSuccess);
    razorpay.on(
        Razorpay.EVENT_PAYMENT_ERROR, paymentcontroller.handlePaymentError);
    razorpay.on(
        Razorpay.EVENT_EXTERNAL_WALLET, paymentcontroller.handleExternalWallet);
    super.onInit();
  }

  @override
  void onClose() {
    paymentcontroller.razorpay.clear();
    super.onClose();
  }

  OrderService orderservice = OrderService();
  AddressService addressservice = AddressService();
  CartService cartservice = CartService();
  bool isLoading = false;
  List<GetOrderModel>? ordersList = [];
  GetOrderModel? singleModel;
  GetAddressModel? addressModel;
  List<GetSingelCartProductModel> cartModel = [];
  int? totalSave;
  String? deliveryDate;
  List<String> productIds = [];

  void startLoading() {
    isLoading = true;
    update();
  }

  void getAllOrders() async {
    isLoading = true;
    update();
    await OrderService().getAllOrders().then((value) {
      if (value != null) {
        ordersList = value;
        update();
        isLoading = false;
        update();
      } else {
        isLoading = false;
        update();
      }
    });
    return null;
  }

  void getSingleOrder(String orderId) async {
    isLoading = true;
    await orderservice.getSingleOrders(orderId).then((value) {
      if (value != null) {
        singleModel = value;
        update();
        deliveryDate = formatDate(singleModel!.deliveryDate.toString());
        update();
        isLoading = false;
        update();
      } else {
        isLoading = false;
        update();
      }
    });
  }

  Future<void> cancelOrder(String orderId) async {
    isLoading = true;
    update();

    await orderservice.cancelOrder(orderId).then((value) {
      if (value != null) {
        isLoading = false;
        update();
      } else {
        isLoading = false;
        update();
      }
    });
  }

  void getSingleAddress(String addressId) async {
    isLoading = false;
    update();
    await addressservice.getSingleAddress(addressId).then((value) {
      if (value != null) {
        log("message");
        addressModel = value;
        update();
        isLoading = false;
        update();
      } else {
        isLoading = false;
        update();
      }
    });
    return null;
  }

  void getSingleCart(String productId, String cartId) async {
    await cartservice.getSingleCart(productId, cartId).then((value) {
      if (value != null) {
        cartModel = value;
        update();
        isLoading = false;
        update();
      } else {
        isLoading = false;
        update();
      }
    });
  }

  void toOrderScreen(productId, cartId) {
    getSingleCart(
      productId,
      cartId,
    );
    update();
    Get.to(
      ScreenOrderSummery(
        cartId: cartId,
        productId: productId,
        screenCheck: OrderScreenEnum.buyOneProductOrderScreen,
      ),
    );
  }

  void sendOrderDetials() {
    Share.share(
        "ShoeCart Order -Order Id:${singleModel!.id},Total Products:${singleModel!.products.length},Total Price:${singleModel!.totalPrice},Delivery Date:$deliveryDate");
  }

  String? formatDate(String date) {
    final a = date.split(' ');
    return a[0];
  }

  String? formatCancelDate(String? date) {
    if (date != null) {
      final a = date.split('T');
      return a[0];
    } else {
      return null;
    }
  }
}
