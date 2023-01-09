import 'package:e_commerce/Screens/product_view_screen/view/product_view.dart';
import 'package:e_commerce/Screens/wishlist/model/wishlist_mode.dart';
import 'package:e_commerce/Screens/wishlist/service/wishlist_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  bool isLoading = false;
  WishlistModel? wmodel;
  List<dynamic> wishList = [];
  WishlistService wishlistService = WishlistService();

  WishListController(context) {
    getWishlist(context);
  }

  void getWishlist(context) async {
    isLoading = true;
    update();
    await wishlistService.getWishlist(context).then(
      (value) {
        if (value != null) {
          wmodel = value;
          update();
          wishList = wmodel!.products.map((e) => e.product.id).toList();
          update();
          isLoading = false;
          update();
        } else {
          isLoading = false;
          update();
        }
      },
    );
  }

  void addOrRemoveFromWishlist(context, String productId) async {
    isLoading = true;
    update();
    await wishlistService.addOrRemoveWishlist(context, productId).then((value) {
      if (value != null) {
        wishlistService.getWishlist(context).then((value) {
          if (value != null) {
            wmodel = value;
            update();
            getWishlist(context);
            isLoading = false;
            update();
          } else {
            isLoading = false;
            update();
          }
        });
        if (value == 201) {
          Get.snackbar(
            "Added",
            "Item added to Wishlist",
            colorText: Colors.green,
            icon: const Icon(Icons.add_alert_rounded),
          );
        } else if (value == 204) {
          Get.snackbar(
            "Remove",
            "Item removed from Wishlist",
            colorText: Colors.red,
            icon: const Icon(Icons.remove_circle_outline_rounded),
          );
        }
      } else {
        isLoading = false;
        update();
      }
    });
  }

  void toProductScreen(context, index) {
    Navigator.of(context)
        .pushNamed(ScreenProductView.routeName, arguments: wishList[index]);
  }
}
