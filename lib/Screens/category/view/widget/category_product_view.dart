import 'package:e_commerce/Screens/home/controller/home_controller.dart';
import 'package:e_commerce/Screens/home/view/shimmer/product_shimmer.dart';

import 'package:e_commerce/common/api/api_baseurl.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CategoryProductView extends StatelessWidget {
  CategoryProductView({
    Key? key,
    required this.controllers,
    required this.width,
    required this.height,
  }) : super(key: key);

  final HomeContorller controllers;
  final double width;
  final double height;
  final apibaseUrl = ApiBaseUrl();

  static const cproductView = '/category_product_view.dart';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final controlle = controllers.findByCategoryId(productId);
    return GetBuilder<HomeContorller>(
      builder: (controller) => controllers.isLoding == true
          ? const ProductShimmer()
          : GridView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 1 / 1.7),
              itemBuilder: (BuildContext ctx, int index) {
                return SizedBox(
                  // width: width * 0.1,
                  // color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            InkWell(
                              onTap: () {
                                controllers.toProdutScreen(index);
                              },
                              child: Container(
                                width: width * 0.5,
                                height: height * 0.28,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: colorWhite,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        '${apibaseUrl.baseUrl}/products/${controlle[index].image[0]}'),
                                    // fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            // GetBuilder<WishListController>(
                            //   builder: (controller) => Positioned(
                            //     right: 0,
                            //     bottom: 0,
                            //     child: IconButton(
                            //       onPressed: () {
                            //         wishlistC.addOrRemoveFromWishlist(
                            //             context,
                            //             wishlistC.wmodel!.products[index]
                            //                 .product.id);
                            //       },
                            //       icon: Icon(
                            //         wishlistC.wishList.contains(wishlistC
                            //                 .wmodel!.products[index].product.id)
                            //             ? Icons.favorite_border_outlined
                            //             : Icons.favorite,
                            //         color: wishlistC.wishList.contains(wishlistC
                            //                 .wmodel!.products[index].product.id)
                            //             ? colorWhite
                            //             : Colors.red,
                            //       ),
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        // RatingBar.builder(
                        //   initialRating: double.parse(
                        //       wishlistC.wmodel!.products[index].product.rating),
                        //   itemSize: 15,
                        //   minRating: 1,
                        //   direction: Axis.horizontal,
                        //   allowHalfRating: true,
                        //   ignoreGestures: true,
                        //   itemBuilder: (context, _) => const Icon(
                        //     Icons.star,
                        //     color: Colors.amber,
                        //   ),
                        //   onRatingUpdate: (startRating) {
                        //     log(startRating.toString());
                        //   },
                        // ),
                        Text(
                          controlle[index].description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.w400),
                        ),
                        kHeight10,
                        Row(
                          children: [
                            Text(
                              "₹ ${controlle[index].price.toString()}",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: controlle.length,
            ),
    );
  }
}
