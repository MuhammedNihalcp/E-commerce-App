import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';

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
    return SizedBox(
      width: double.infinity  ,
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
            itemsD[index];
          },
          scrollDirection: Axis.horizontal,
        ),
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return Image(
            image: NetworkImage(itemsD[index]),
            fit: BoxFit.cover,
          );
        },
        itemCount: itemsD.length,
      ),
    );
  }
}