import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/Screens/home/controller/home_controller.dart';

import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.itemsD,
  }) : super(key: key);

  final double height;
  final double width;
  final List<String> itemsD;

  @override
  Widget build(BuildContext context) {
    final carousalC = Get.put(HomeContorller(context));
    return GetBuilder<HomeContorller>(
      builder: (controller) => Stack(
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
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                onPageChanged: (index, reason) {
                  carousalC.smoothIndicator(index);
                },
                scrollDirection: Axis.horizontal,
              ),
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Image(
                  // width: double.infinity,
                  image: NetworkImage(
                      'http://172.16.7.123:5000/carousals/${carousalC.carousalList[index].image}'),
                  fit: BoxFit.cover,
                );
              },
              itemCount: carousalC.carousalList.length,
            ),
          ),
          Positioned(
            top: height * 0.18,
            left: width * 0.45,
            child: AnimatedSmoothIndicator(
              activeIndex: carousalC.activeIndex,
              count: carousalC.carousalList.length,
              effect: const WormEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  dotColor: colorWhite,
                  activeDotColor: Colors.orange),
            ),
          ),
        ],
      ),
    );
  }
}