import 'package:e_commerce/Screens/category/view/category_view.dart';
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
    required this.controller,
  }) : super(key: key);

  final double height;
  final HomeContorller controller;
  final apibaseUrl = ApiBaseUrl();

  @override
  Widget build(BuildContext context) {
    return controller.isLoding == true
        ? const CategoryShimmer()
        : LimitedBox(
            maxHeight: height * 0.19,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                controller.categoryList.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(ScreenCategory.categoryRoute,
                          arguments: controller.categoryList[index].id);
                    },
                    child: Column(
                      // alignment: AlignmentDirectional.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              '${apibaseUrl.baseUrl}/category/${controller.categoryList[index].image}'),
                          radius: 30,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          controller.categoryList[index].name,
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
