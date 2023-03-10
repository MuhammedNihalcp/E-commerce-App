import 'package:e_commerce/Screens/category/view/category_view.dart';

import 'package:e_commerce/Screens/home/controller/home_controller.dart';
import 'package:e_commerce/Screens/home/view/shimmer/category_shimmer.dart';
import 'package:e_commerce/common/api/api_baseurl.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/Screens/category/model/enum_category_model.dart';

// ignore: must_be_immutable
class HomePageCategoryItems extends StatelessWidget {
  HomePageCategoryItems({
    Key? key,
    required this.height,
    required this.controllers,
  }) : super(key: key);

  final double height;
  final HomeContorller controllers;
  final apibaseUrl = ApiBaseUrl();
  double width = Get.size.width;

  @override
  Widget build(BuildContext context) {
    return controllers.isLoding == true
        ? const CategoryShimmer()
        : LimitedBox(
            maxHeight: height * 0.19,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                controllers.categoryList.length >= 8
                    ? 8
                    : controllers.categoryList.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Get.to(
                        ScreenCategory(
                          width: width,
                          height: height,
                          selectCategoryScreen:
                              CategoryScreenEnum.productSelectCategoryScreen,
                          categoryId: controllers.categoryList[index].id,
                        ),
                      );
                    },
                    child: Column(
                      // alignment: AlignmentDirectional.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              '${apibaseUrl.baseUrl}/category/${controllers.categoryList[index].image}'),
                          radius: 30,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          controllers.categoryList[index].name,
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
