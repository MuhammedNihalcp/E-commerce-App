import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/widgets.dart';

class YourAccountDetailsImages extends StatelessWidget {
  const YourAccountDetailsImages({
    Key? key,
    required this.height,
    required this.order,
    required this.width,
  }) : super(key: key);

  final double height;
  final List<String> order;
  final double width;

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: height * 0.18,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          order.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              // color: colorGrey,
              width: width * 0.5,
              height: height * 0.18,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: borderColor,
                ),
                color: colorWhite,
                image: DecorationImage(
                  image: NetworkImage(order[index]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}