import 'package:e_commerce/Screens/home/controller/home_controller.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomePageCategoryItems extends StatelessWidget {
  HomePageCategoryItems({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;
  final homecategoryC = Get.put(HomeContorller());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeContorller>(
      builder: (controller) => LimitedBox(
        maxHeight: 100,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
            10,
            (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    width: height * 0.13,
                    height: height * 0.13,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(
                              'http://172.16.7.123:5000/uploads/category/${controller.categoryList[index].image}'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const Center(
                    child: Text(
                      "Women's\nFasion",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        color: colorWhite,
                        fontWeight: FontWeight.bold,
                      ),
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
