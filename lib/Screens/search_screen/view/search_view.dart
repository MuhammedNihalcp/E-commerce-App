import 'dart:developer';

import 'package:e_commerce/Screens/home/controller/home_controller.dart';
import 'package:e_commerce/Screens/search_screen/view/widget/search_shimmer.dart';
import 'package:e_commerce/common/api/api_baseurl.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  HomeContorller homeController = Get.put(HomeContorller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: colorVailet,
        title: const Text('Search'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: GetBuilder<HomeContorller>(
            builder: (controller) {
              return Column(
                children: [
                  SizedBox(
                    height: 45,
                    child: CupertinoSearchTextField(
                      autofocus: true,
                      prefixInsets:
                          const EdgeInsetsDirectional.fromSTEB(10, 4, 5, 3),
                      backgroundColor: const Color(0xFFF0EFFF),
                      controller: homeController.searchController,
                      onChanged: (value) {
                        homeController.search(value);
                      },
                    ),
                  ),
                  kHeight20,
                  homeController.seachResult.isEmpty
                      ? SizedBox(
                          height: Get.size.height * 0.7,
                          child: Center(
                            child: Text(
                              'No Search Results Found',
                              style: gooleaborto,
                            ),
                          ),
                        )
                      : homeController.isLoding == true
                          ? const NewlyLaunchedShimmer()
                          : ListView.separated(
                              physics: const ScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    homeController.toProdutScreen(index);
                                  },
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 30),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            kWidth10,
                                            Container(
                                              height: 100,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                image: NetworkImage(
                                                  '${ApiBaseUrl().baseUrl}/products/${homeController.seachResult[index].image[0]}',
                                                ),
                                              )),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    homeController
                                                        .seachResult[index]
                                                        .name,
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontFamily: 'Manrope',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  RatingBar.builder(
                                                    initialRating: double.parse(
                                                        homeController
                                                            .seachResult[index]
                                                            .rating),
                                                    itemSize: 15,
                                                    minRating: 1,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    ignoreGestures: true,
                                                    itemBuilder: (context, _) =>
                                                        const Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                    ),
                                                    onRatingUpdate:
                                                        (startRating) {
                                                      log(startRating
                                                          .toString());
                                                    },
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "${homeController.seachResult[index].offer}%Off",
                                                        style: const TextStyle(
                                                          color: Colors.green,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16,
                                                          fontFamily: "Manrope",
                                                        ),
                                                      ),
                                                      kWidth10,
                                                      Text(
                                                        "₹${homeController.seachResult[index].price}",
                                                        style: const TextStyle(
                                                          color: colorBlack,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          fontFamily: "Manrope",
                                                        ),
                                                      ),
                                                      kWidth10,
                                                      Text(
                                                        "₹${(homeController.seachResult[index].price - homeController.seachResult[index].discountPrice).round()}",
                                                        style: const TextStyle(
                                                          color:
                                                              colorremoveSnack,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: "Manrope",
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      kHeight10,
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const Divider();
                              },
                              itemCount: homeController.seachResult.length,
                            ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
