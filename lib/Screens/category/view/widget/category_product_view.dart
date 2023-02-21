import 'package:e_commerce/Screens/category/model/enum_category_model.dart';
import 'package:e_commerce/Screens/home/controller/home_controller.dart';
import 'package:e_commerce/Screens/product_view_screen/model/product_model.dart';

import 'package:e_commerce/common/api/api_baseurl.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';



// ignore: must_be_immutable
class CategoryProductView extends StatelessWidget {
  CategoryProductView({
    Key? key,
    required this.controllers,
    required this.width,
    required this.height,
    required this.homeCont,
    required this.selectedCategoryScreen,
  }) : super(key: key);

  List<ProductModel> controllers;
  final double width;
  final double height;
  final HomeContorller homeCont;
  final apibaseUrl = ApiBaseUrl();
  final CategoryScreenEnum selectedCategoryScreen;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
                        homeCont.toProdutScreen(index);
                      },
                      child: Container(
                        width: width * 0.5,
                        height: height * 0.28,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: colorWhite,
                          image: DecorationImage(
                            image: NetworkImage(selectedCategoryScreen ==
                                    CategoryScreenEnum.normalCategoryScreen
                                ? '${apibaseUrl.baseUrl}/products/${homeCont.productList[index].image[0]}'
                                : '${apibaseUrl.baseUrl}/products/${controllers[index].image[0]}'),
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
                  selectedCategoryScreen ==
                          CategoryScreenEnum.normalCategoryScreen
                      ? homeCont.productList[index].description
                      : controllers[index].description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w400),
                ),
                kHeight10,
                Row(
                  children: [
                    Text(
                      selectedCategoryScreen ==
                              CategoryScreenEnum.normalCategoryScreen
                          ? "₹ ${homeCont.productList[index].price}"
                          : "₹ ${controllers[index].price}",
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
      itemCount:
          selectedCategoryScreen == CategoryScreenEnum.normalCategoryScreen
              ? homeCont.productList.length
              : controllers.length,
    );
  }
}
