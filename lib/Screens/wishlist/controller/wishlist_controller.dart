import 'package:e_commerce/Screens/product_view_screen/view/product_view.dart';
import 'package:e_commerce/Screens/wishlist/model/wishlist_mode.dart';
import 'package:e_commerce/Screens/wishlist/service/wishlist_service.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  bool isLoading = false;
  WishlistModel? wmodel;
  List<dynamic> wishList = [];
  WishlistService wishlistService = WishlistService();

  WishListController() {
    getWishlist();
  }

  void getWishlist() async {
    isLoading = true;
    update();
    await wishlistService.getWishlist().then(
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

  void addOrRemoveFromWishlist( String productId) async {
    isLoading = true;
    update();
    await wishlistService.addOrRemoveWishlist( productId).then((value) {
      if (value != null) {
        getWishlist();
        // wishlistService.getWishlist().then((value) {
        //   if (value != null) {
        //     wmodel = value;
        //     update();
        //     getWishlist();
        //     isLoading = false;
        //     update();
        //   } else {
        //     isLoading = false;
        //     update();
        //   }
        // });
        if (value == 201) {
          Get.snackbar(
            "Added",
            "Item added to Wishlist",
            colorText: coloraddSnack,
            icon: const Icon(Icons.add_alert_rounded),
          );
        } else if (value == 204) {
          Get.snackbar(
            "Remove",
            "Item removed from Wishlist",
            colorText: colorremoveSnack,
            icon: const Icon(Icons.remove_circle_outline_rounded),
          );
        }
        isLoading = false;
        update();
      } else {
        isLoading = false;
        update();
      }
    });
  }

  void toProductScreen(index) {
    Get.toNamed(ScreenProductView.routeName,arguments: wishList[index]);
   
  }
}
