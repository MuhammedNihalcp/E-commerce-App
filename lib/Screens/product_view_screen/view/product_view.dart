import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/Screens/home/controller/home_controller.dart';
import 'package:e_commerce/Screens/product_view_screen/controller/product_controller.dart';
import 'package:e_commerce/Screens/product_view_screen/view/widget/bottom_navigator.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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

  final productC = Get.put(ProductController());

  List<String> sizes = [
    '35',
    '41',
    '44',
  ];

  @override
  Widget build(BuildContext context) {
    final homeC = Get.put(HomeContorller(context));
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final controlle = homeC.findById(productId);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: GetBuilder<ProductController>(
          builder: (controller) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    CarouselSlider.builder(
                      options: CarouselOptions(
                        height: height * 0.5,
                        aspectRatio: 1 / 4,
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
                          productC.changeCarousalPosition(index);
                        },
                        scrollDirection: Axis.horizontal,
                      ),
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) {
                        return Image(
                          width: width,
                          image: NetworkImage(
                              'http://172.16.7.123:5000/products/${controlle.image[index]}'),
                          fit: BoxFit.cover,
                        );
                      },
                      itemCount: itemsD.length,
                    ),
                    Positioned(
                      top: height * 0.45,
                      left: width * 0.45,
                      child: AnimatedSmoothIndicator(
                        activeIndex: itemsD.length,
                        count: itemsD.length,
                        effect: const WormEffect(
                            dotHeight: 10,
                            dotWidth: 10,
                            dotColor: colorWhite,
                            activeDotColor: Colors.orange),
                      ),
                    ),
                  ],
                ),
                kHeight20,
                Text(
                  controlle.description,
                  style: const TextStyle(
                    color: colorBlack,
                  ),
                ),
                kHeight20,
                Row(
                  children: [
                    Text(
                      controlle.price.toString(),
                      style: const TextStyle(color: colorBlack),
                    ),
                  ],
                ),
                kHeight20,
                Row(
                  children: const [
                    Text(
                      'Size',
                      style: TextStyle(
                        color: colorBlack,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                GetBuilder<ProductController>(
                  builder: (controller) => Row(
                    children: List.generate(
                      sizes.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Material(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(3),
                            onTap: () => productC.onSizeSelected(index),
                            child: Ink(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: productC.activeSize == index
                                      ? const Color(0xFF667EEA)
                                      : const Color(0xFFF3F3F3),
                                  borderRadius: BorderRadius.circular(3)),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  sizes[index],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                          color: productC.activeSize == index
                                              ? Colors.white
                                              : Colors.black87),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: ProductBottomNavigator(
        width: width,
        height: height,
      ),
    );
  }
}
