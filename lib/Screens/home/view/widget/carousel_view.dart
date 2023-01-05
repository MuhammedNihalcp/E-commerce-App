import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/Screens/home/controller/home_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    Key? key,
    required this.height,
    required this.itemsD,
  }) : super(key: key);

  final double height;
  final List<String> itemsD;

  @override
  Widget build(BuildContext context) {
    final carousalC = Get.put(HomeContorller(context));
    return GetBuilder<HomeContorller>(
      builder: (controller) => SizedBox(
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
              image: NetworkImage(
                  'http://172.16.7.123:5000/carousal/${carousalC.carousalList[index].image}'),
              fit: BoxFit.cover,
            );
          },
          itemCount: carousalC.carousalList.length,
        ),
      ),
    );
  }
}
