import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/util/shimmer/shimmer.dart';

import 'package:flutter/material.dart';

class CarouselShimmer extends StatelessWidget {
  const CarouselShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        SizedBox(
          width: double.infinity,
          child: ShimmerWidget.rectangle(height: 150, width: double.infinity),
        ),
        kHeight10,
        // Positioned(
        //   top: 128,
        //   left: 150,
        //   child: AnimatedSmoothIndicator(
        //     activeIndex: value.activeIndex,
        //     count: value.carousalList.length,
        //     effect: const WormEffect(
        //         dotHeight: 10,
        //         dotWidth: 10,
        //         dotColor: kWhite,
        //         activeDotColor: kTextfieldColor),
        //   ),
        // ),
      ],
    );
  }
}
