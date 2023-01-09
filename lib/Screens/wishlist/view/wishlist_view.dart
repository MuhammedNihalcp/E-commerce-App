import 'dart:developer';

import 'package:e_commerce/Screens/wishlist/controller/wishlist_controller.dart';

import 'package:e_commerce/Screens/wishlist/view/shimmer/wishlist_shimmer.dart';
import 'package:e_commerce/common/api/api_baseurl.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class WishlistScreen extends StatelessWidget {
  WishlistScreen({super.key});

  final apibaseUrl = ApiBaseUrl();

  @override
  Widget build(BuildContext context) {
    final wishlistC = Get.put(WishListController(context));
    // double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
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
            onPressed: () {},
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
                    height: MediaQuery.of(context).size.height / 1,
                    child: const Center(
                      child: Text('Wishlist is Empty'),
                    ),
                  )
                : ListView.separated(
                    itemBuilder: ((context, index) => ListTile(
                          onTap: (() =>
                              wishlistC.toProductScreen(context, index)),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                '${apibaseUrl.baseUrl}/products/${wishlistC.wmodel!.products[index].product.image[0]}'),
                          ),
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(wishlistC
                                  .wmodel!.products[index].product.name),
                              RatingBar.builder(
                                initialRating: double.parse(wishlistC
                                    .wmodel!.products[index].product.rating),
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
                          trailing: IconButton(
                              onPressed: () {
                                wishlistC.addOrRemoveFromWishlist(
                                  context,
                                  wishlistC.wmodel!.products[index].product.id,
                                );
                              },
                              icon: const Icon(
                                Icons.favorite_sharp,
                                color: Colors.red,
                              )),
                        )),
                    separatorBuilder: ((context, index) => const Divider()),
                    itemCount: wishlistC.wmodel!.products.length,
                  ),
      )),
    );
  }
}
