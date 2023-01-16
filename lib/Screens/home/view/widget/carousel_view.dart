import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/Screens/home/controller/home_controller.dart';
import 'package:e_commerce/Screens/home/view/shimmer/carousel_shimmer.dart';
import 'package:e_commerce/common/api/api_baseurl.dart';

import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselWidget extends StatelessWidget {
  CarouselWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.controller,
    // required this.itemsD,
  }) : super(key: key);

  final double height;
  final double width;
  final HomeContorller controller;
  // final List<String> itemsD;
  final apibaseUrl = ApiBaseUrl();
  

  @override
  Widget build(BuildContext context) {
    return controller.isLoding == true
        ? const CarouselShimmer()
        : Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    height: height * 0.2,
                    aspectRatio: 16 / 9,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    onPageChanged: (index, reason) {
                      controller.smoothIndicator(index);
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return Container(
                      width: width,
                      height: height * 0.28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: colorWhite,
                        image: DecorationImage(
                          image: NetworkImage(
                              '${apibaseUrl.baseUrl}/carousals/${controller.carousalList[index].image}'),
                          // fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  itemCount: controller.carousalList.length,
                ),
              ),
              Positioned(
                top: height * 0.18,
                left: width * 0.45,
                child: AnimatedSmoothIndicator(
                  activeIndex: controller.activeIndex,
                  count: controller.carousalList.length,
                  effect: const WormEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      dotColor: colorWhite,
                      activeDotColor: Colors.orange),
                ),
              ),
            ],
          );
  }
}
