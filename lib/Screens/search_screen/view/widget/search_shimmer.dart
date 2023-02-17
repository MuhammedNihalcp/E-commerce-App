import 'package:e_commerce/util/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class NewlyLaunchedShimmer extends StatelessWidget {
  const NewlyLaunchedShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 6 / 8,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        itemBuilder: (context, index) {
          return ShimmerWidget.rectangle(
            height: 20,
            width: 20,
            radius: BorderRadius.circular(20),
          );
        },
        itemCount: 12,
      ),
    );
  }
}
