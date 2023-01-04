import 'package:e_commerce/Screens/home/controller/home_controller.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePageCategoryItems extends StatelessWidget {
  HomePageCategoryItems({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    final homecategoryC = Get.put(HomeContorller(context));
    return GetBuilder<HomeContorller>(
      builder: (controller) => LimitedBox(
        maxHeight: height * 0.17,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
            homecategoryC.categoryList.length,
            (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                // alignment: AlignmentDirectional.center,
                children: [
                  // Container(
                  //   width: height * 0.13,
                  //   height: height * 0.13,
                  //   decoration: BoxDecoration(
                  //     color: Colors.black,
                  //     borderRadius: BorderRadius.circular(10),
                  //     image: DecorationImage(
                  //         image:  NetworkImage(
                  //            'http://172.16.7.123:5000/category/${homecategoryC.categoryList[index].image}'),
                  //         fit: BoxFit.cover),
                  //   ),
                  // ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'http://172.16.7.123:5000/category/${homecategoryC.categoryList[index].image}'),
                    radius: 30,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    homecategoryC.categoryList[index].name,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      color: colorBlack,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
