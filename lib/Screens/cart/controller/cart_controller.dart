import 'dart:developer';

import 'package:e_commerce/Screens/cart/model/add_cart_model.dart';
import 'package:e_commerce/Screens/cart/model/get_cart_model.dart';
import 'package:e_commerce/Screens/cart/service/cart_service.dart';
import 'package:e_commerce/Screens/cart/view/cart_view.dart';
import 'package:e_commerce/Screens/navigator_screen/controller.dart';

import 'package:e_commerce/Screens/product_view_screen/view/product_view.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CartController extends GetxController {
  bool isLoading = false;
  List<String> cartList = [];
  List<String> cartItemsId = [];
  List<String> cartitemsPayId = [];
  int quantity = 1;
  int totalproductCount = 1;
  GetCartModel? model;
  int? totalSave;
  CartService service = CartService();
  final bottomC = Get.put(LandingPageController());

  void getCart() async {
    isLoading = true;
    update();
    await service.getCart().then((value) {
      if (value != null) {
        model = value;
        update();
         cartItemsId = model!.products.map((e) => e.product.id).toList();
          cartitemsPayId = model!.products.map((e) => e.id).toList();
          cartList = model!.products.map((e) => e.product.id).toList();
        totalSave = (model!.totalPrice - model!.totalDiscount).toInt();
        totalProductCount();
        update();
        isLoading = false;
        update();
      } else {
        isLoading = false;
        update();
      }
      return null;
    });
  }

  void addToCart(String productId, String size) async {
    log('here');
    isLoading = true;
    update();
    final AddCartModel model = AddCartModel(
      size: size.toString(),
      quantity: quantity,
      productId: productId,
    );
    await service.addToCart(model).then((value) {
      if (value != null) {
        getCart();
        if (value == "product added to cart successfully") {
          Get.snackbar(
            "Added",
            "Product Added To Cart Successfully",
            colorText: coloraddSnack,
            icon: const Icon(
              Icons.add_alert_rounded,
              color: colorBlack,
            ),
          );
        }
      } else {
        null;
      }
    });
  }

  void removeCart(productId) {
    log('get in to remove controller');
    service.removeFromCart(productId).then(
      (value) {
        if (value != null) {
          getCart();
          log(totalSave.toString());
          Get.back();
          Get.snackbar(
            "Remove",
            "Product removed from cart successfully",
            colorText: colorremoveSnack,
            icon: const Icon(
              Icons.remove_circle,
              color: colorBlack,
            ),
          );
          update();
        } else {
          return;
        }
      },
    );
  }

  void totalProductCount() {
    int count = 0;
    for (var i = 0; i < model!.products.length; i++) {
      count = count + model!.products[i].qty;
    }
    totalproductCount = count;
    update();
  }

  Future<void> incrementDecrementQty(
      int qty, String productId, int productQuantity, String size) async {
    final AddCartModel addCartModel = AddCartModel(
      size: size.toString(),
      quantity: quantity,
      productId: productId,
    );
    if (qty == 1 && productQuantity >= 1) {
      await CartService().addToCart(addCartModel).then(
        (value) async {
          if (value != null) {
            await CartService().getCart().then(
              (value) {
                if (value != null) {
                  model = value;
                  update();
                  totalProductCount();
                  cartItemsId =
                      model!.products.map((e) => e.product.id).toList();
                  update();
                  totalSave = model!.totalDiscount.toInt() -
                      model!.totalPrice.toInt();
                  update();
                } else {
                  null;
                }
              },
            );
          } else {
            null;
          }
        },
      );
    }
  }

  void goToCartFromProduct() {
    getCart();
    Get.to(() => ScreenOrder());
  }

  void toProductScreen(index) {
    Get.toNamed(ScreenProductView.routeName, arguments: cartItemsId[index]);
  }
}
