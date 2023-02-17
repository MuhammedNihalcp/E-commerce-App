import 'package:e_commerce/Screens/cart/view/cart_view.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class YourCartListImages extends StatelessWidget {
  const YourCartListImages({
    Key? key,
    required this.height,
    required this.width,
    required this.order,
  }) : super(key: key);

  final double height;
  final double width;
  final List<String> order;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: Center(
        child: ListTile(
          onTap: () {
            Get.to(() => ScreenOrder());
          },
          title: const Text('Shopping List'),
          subtitle: const Text(
            'private.Degault',
            style: TextStyle(
              color: lightgrey,
            ),
          ),
          trailing: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              width: width * 0.4,
              height: height * 0.18,
              image: NetworkImage(order[0]),
            ),
          ),
        ),
      ),
    );
  }
}
