import 'package:e_commerce/Screens/cart/controller/cart_controller.dart';
import 'package:e_commerce/Screens/cart/view/widget/add_remove_button/add_remove_button.dart';
import 'package:e_commerce/Screens/cart/view/widget/cart_bottom_button/cart_bottom_button.dart';
import 'package:e_commerce/Screens/cart/view/widget/cart_image_detail/cart_image_details.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:get/get.dart';

class ScreenOrder extends StatelessWidget {
  ScreenOrder({super.key});

  final cartC = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorVailet,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'My',
              style: TextStyle(
                letterSpacing: 3,
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Cart',
              style: TextStyle(
                letterSpacing: 3,
                fontWeight: FontWeight.bold,
                color: colorBlack,
              ),
            )
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.04),
          child: const SizedBox(),
        ),
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<CartController>(
          builder: (controller) => ListView.separated(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomCard(
                    width: double.infinity,
                    height: height * 0.39,
                    color: colorWhite,
                    borderRadius: 20,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CartImageAndDetails(
                            width: width,
                            height: height,
                            controller: cartC,
                            index: index,
                          ),
                          kHeight10,
                          AddAndRemoveButton(
                            height: height,
                            width: width,
                          ),
                          Row(
                            children: [
                              CartBottomButton(
                                onPressed: () {},
                                text: 'Save for later',
                              ),
                              kWidth10,
                              CartBottomButton(
                                onPressed: () {},
                                text: 'See more like this',
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(),
              itemCount: 5),
        ),
      )),
    );
  }
}
