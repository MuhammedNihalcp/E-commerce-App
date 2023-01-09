

import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/util/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Row(
            children: [
              kWidth10,
              Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: const ShimmerWidget.circle(height: 60, width: 60),
                  ),
                  kHeight10,
                  const ShimmerWidget.rectangle(height: 20, width: 60)
                ],
              ),
            ],
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        separatorBuilder: (BuildContext context, int index) {
          return kWidth10;
        },
      ),
    );
  }
}
