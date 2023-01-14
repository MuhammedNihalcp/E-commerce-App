import 'dart:developer';
import 'dart:ui';

import 'package:e_commerce/Screens/cart/controller/cart_controller.dart';
import 'package:e_commerce/Screens/wishlist/controller/wishlist_controller.dart';

import 'package:e_commerce/Screens/wishlist/view/shimmer/wishlist_shimmer.dart';
import 'package:e_commerce/common/api/api_baseurl.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class WishlistScreen extends StatelessWidget {
  WishlistScreen({Key? key, required this.width, required this.height})
      : super(key: key);

  final apibaseUrl = ApiBaseUrl();
  final wishlistC = Get.put(WishListController());

  final double width;
  final double height;

  final cartC = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    double height = Get.size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: colorVailet,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'My ',
              style: TextStyle(
                letterSpacing: 3,
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Wishlist',
              style: TextStyle(
                letterSpacing: 3,
                fontWeight: FontWeight.bold,
                color: colorBlack,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              cartC.goToCartFromProduct();
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.04),
          child: const SizedBox(),
        ),
      ),
      body: SafeArea(
          child: GetBuilder<WishListController>(
        builder: (controller) => wishlistC.isLoading == true
            ? const WishListShimmer()
            : wishlistC.wmodel == null || wishlistC.wmodel!.products.isEmpty
                ? SizedBox(
                    height: Get.size.height / 1,
                    child: const Center(
                      child: Text('Wishlist is Empty'),
                    ),
                  )
                : ListView.separated(
                    itemBuilder: ((context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomCard(
                            borderRadius: 20,
                            child: ListTile(
                              onTap: (() => wishlistC.toProductScreen(index)),
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    '${apibaseUrl.baseUrl}/products/${wishlistC.wmodel!.products[index].product.image[0]}'),
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(wishlistC
                                      .wmodel!.products[index].product.name),
                                  RatingBar.builder(
                                    initialRating: double.parse(wishlistC
                                        .wmodel!
                                        .products[index]
                                        .product
                                        .rating),
                                    itemSize: 15,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    ignoreGestures: true,
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (startRating) {
                                      log(startRating.toString());
                                    },
                                  ),
                                ],
                              ),
                              subtitle: Row(
                                children: [
                                  Text(
                                    '-${wishlistC.wmodel!.products[index].product.offer.toString()}%',
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                  kWidth10,
                                  Text(
                                    '₹${wishlistC.wmodel!.products[index].product.price.toString()}',
                                    style: const TextStyle(color: colorBlack),
                                  ),
                                ],
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    wishlistC.addOrRemoveFromWishlist(
                                      wishlistC
                                          .wmodel!.products[index].product.id,
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.favorite_sharp,
                                    color: Colors.red,
                                  )),
                            ),
                          ),
                        )),
                    separatorBuilder: ((context, index) => const SizedBox()),
                    itemCount: wishlistC.wmodel!.products.length,
                  ),
      )),
    );
  }
}
