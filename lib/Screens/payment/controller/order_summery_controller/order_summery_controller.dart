import 'dart:developer';

import 'package:e_commerce/Screens/account/model/get_account_model.dart';
import 'package:e_commerce/Screens/account/service/add_account_service.dart';
import 'package:e_commerce/Screens/cart/model/get_single_cart_model.dart';
import 'package:e_commerce/Screens/cart/service/cart_service.dart';
import 'package:e_commerce/Screens/payment/model/get_order_model.dart';
import 'package:e_commerce/Screens/payment/service/order_service.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderSummeryController extends GetxController {
  // int currentStep = 0;

  // void onStepTap(step) {
  //   currentStep = step;
  //   update();
  // }

  // List<Step> steps = [
  //   const Step(
  //     state: StepState.indexed,
  //     title: Text(
  //       'Address',
  //       style: TextStyle(color: Colors.black),
  //     ),
  //     content: Text(
  //       '',
  //       style: TextStyle(color: Colors.blue),
  //     ),
  //     isActive: true,
  //   ),
  //   const Step(
  //     title: Text(
  //       'Order summery',
  //       style: TextStyle(color: Colors.black),
  //     ),
  //     // state: StepState.editing,
  //     content: Text(
  //       '',
  //       style: TextStyle(color: Colors.blue),
  //     ),
  //     // isActive: currentStep == 1,
  //   ),
  //   const Step(
  //     title: Text(
  //       'Payment',
  //       style: TextStyle(color: Colors.black),
  //     ),
  //     content: Text(
  //       '',
  //       style: TextStyle(color: Colors.blue),
  //     ),
  //     // isActive: currentStep == 2,
  //     // state: StepState.editing
  //   )
  // ];

  // void onStepContinue() {
  //   if (currentStep < steps.length - 1) {
  //     currentStep = currentStep + 1;
  //     update();
  //   } else {
  //     currentStep = 0;
  //     update();
  //   }
  // }

  // onStepCancel() {
  //   if (currentStep > 0) {
  //     currentStep = currentStep - 1;
  //     update();
  //   } else {
  //     currentStep = 0;
  //     update();
  //   }
  // }

  OrderSummeryController() {
    startLoading();
    getAllOrders();
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
    // Get.to(
    //   OrderScreen(
    //     cartId: cartId,
    //     productId: productId,
    //     screenCheck: OrderScreenEnum.buyOneProductOrderScreen,
    //   ),
    // );
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
