import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/Screens/product_view_screen/controller/product_controller.dart';
import 'package:e_commerce/Screens/product_view_screen/model/product_model.dart';
import 'package:e_commerce/Screens/wishlist/controller/wishlist_controller.dart';
import 'package:e_commerce/common/api/api_baseurl.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductViewCarousal extends StatelessWidget {
  ProductViewCarousal({
    Key? key,
    required this.height,
    required this.productC,
    required this.width,
    required this.controlle,
  }) : super(key: key);

  final double height;
  final ProductController productC;
  final double width;
  final ProductModel controlle;
  final apibaseUrl = ApiBaseUrl();
  @override
  Widget build(BuildContext context) {
    final wishlistC = Get.put(WishListController(context));
    return Stack(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: height * 0.5,
            aspectRatio: 1 / 4,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: false,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (index, reason) {
              productC.changeCarousalPosition(index);
            },
            scrollDirection: Axis.horizontal,
          ),
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return Container(
              width: width * 0.95,
              height: height * 0.28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: colorWhite,
                image: DecorationImage(
                  image: NetworkImage(
                      '${apibaseUrl.baseUrl}/products/${controlle.image[index]}'),
                  // fit: BoxFit.cover,
                ),
              ),
            );
          },
          itemCount: controlle.image.length,
        ),
        IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        Positioned(
          top: height * 0.45,
          left: width * 0.45,
          child: AnimatedSmoothIndicator(
            activeIndex: productC.activeCarousal,
            count: controlle.image.length,
            effect: const WormEffect(
                dotHeight: 10,
                dotWidth: 10,
                dotColor: colorWhite,
                activeDotColor: Colors.orange),
          ),
        ),
        Positioned(
          right: 5,
          top: 0,
          child: GetBuilder<WishListController>(
            builder: (controller) => IconButton(
              onPressed: () {
                wishlistC.addOrRemoveFromWishlist(context, controlle.id);
              },
              icon: Icon(
                wishlistC.wishList.contains(controlle.id)
                    ? Icons.favorite
                    : Icons.favorite_border_outlined,
                color: wishlistC.wishList.contains(controlle.id)
                    ? Colors.red
                    : Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }
}
