import 'package:e_commerce/Screens/wishlist/controller/wishlist_controller.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/util/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListShimmer extends StatelessWidget {
  const WishListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistC = Get.put(WishListController(context));
    return GetBuilder<WishListController>(builder: (controller) {
      return ListView.separated(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Column(
            children: [
              kHeight10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const ShimmerWidget.rectangle(height: 100, width: 100),
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        kHeight10,
                        const ShimmerWidget.rectangle(
                            height: 10, width: 50),
                        kHeight10,
                        const ShimmerWidget.rectangle(
                            height: 10, width: 50),
                        kHeight10,
                        Row(
                          children: const [
                            ShimmerWidget.rectangle(height: 10, width: 20),
                            SizedBox(width: 10,),
                            ShimmerWidget.rectangle(height: 10, width: 30),
                            SizedBox(width: 10,),
                            ShimmerWidget.rectangle(height: 10, width: 30),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20,),
                  const ShimmerWidget.circle(height: 30, width: 30),
                ],
              ),
              kHeight10,
            ],
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: 10,
      );
    });
  }
}
