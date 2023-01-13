import 'package:e_commerce/Screens/home/controller/home_controller.dart';
import 'package:e_commerce/Screens/home/view/shimmer/category_shimmer.dart';
import 'package:e_commerce/common/api/api_baseurl.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomePageCategoryItems extends StatelessWidget {
  HomePageCategoryItems({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;
  final apibaseUrl = ApiBaseUrl();
   final homecategoryC = Get.put(HomeContorller());

  @override
  Widget build(BuildContext context) {
   
    return GetBuilder<HomeContorller>(
      builder: (controller) => homecategoryC.isLoding == true
          ? const CategoryShimmer()
          : LimitedBox(
              maxHeight: height * 0.19,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  homecategoryC.categoryList.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      // alignment: AlignmentDirectional.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              '${apibaseUrl.baseUrl}/category/${homecategoryC.categoryList[index].image}'),
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
