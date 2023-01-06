import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';


class ScreenProductView extends StatelessWidget {
  ScreenProductView({super.key});
  final itemsD = [
    'https://www.shutterstock.com/image-vector/modern-kids-clothes-set-summer-600w-2021848727.jpg',
    'https://www.shutterstock.com/image-photo/young-beautiful-smiling-hipster-woman-600w-2133734771.jpg',
    'https://www.shutterstock.com/image-photo/fashionable-pale-brunette-long-green-600w-1875042193.jpg',
    'https://www.shutterstock.com/image-photo/full-body-profile-photo-cheerful-600w-1898279326.jpg',
    'https://www.shutterstock.com/image-photo/pretty-beautiful-woman-brunette-hair-600w-1695648628.jpg',
  ];
  static String routeName = '/product_view.dart';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider.builder(
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
                  itemsD[index];
                },
                scrollDirection: Axis.horizontal,
              ),
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return const SizedBox();
                // return Image(
                //   image: NetworkImage(itemsD[index]),
                //   fit: BoxFit.cover,
                // );
              },
              itemCount: itemsD.length,
            ),
          ],
        ),
      ),
    );
  }
}
