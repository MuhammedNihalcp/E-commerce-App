import 'package:e_commerce/core/size.dart';
import 'package:flutter/material.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1 / 1.5),
      itemBuilder: (BuildContext ctx, int index) {
        return Container(
          width: width * 0.1,
          color: Colors.blue,
          child: Column(
            children: [
              Container(
                width: width * 0.5,
                height: height * 0.25,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/dress/dress3.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'The midi dress, which falls between a maxi and a mini, is what everyone needs for situations',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              kHeight10,
              Row(
                children: const [
                  Text(
                    '₹ 299',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
      itemCount: 10,
    );
  }
}
