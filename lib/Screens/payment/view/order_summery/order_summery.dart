import 'package:e_commerce/Screens/payment/controller/order_summery_controller/order_summery_controller.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ScreenOrderSummery extends StatelessWidget {
  ScreenOrderSummery({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  final orderSC = Get.put(OrderSummeryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: colorVailet,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Order',
              style: TextStyle(
                letterSpacing: 3,
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Summery',
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
      body: SafeArea(
        child: GetBuilder<OrderSummeryController>(
          builder: (controller) => Column(
            children: [
              CustomCard(
                width: double.infinity,
                height: height * 0.22,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Deliver to:',
                            style: TextStyle(
                                color: colorBlack,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: colorWhite,
                                side: const BorderSide(color: colorGrey)),
                            onPressed: () {},
                            child: const Text(
                              'Change',
                              style: TextStyle(color: colorVailet),
                            ),
                          ),
                        ],
                      ),
                      kHeight5,
                      Row(
                        children: [
                          const Text(
                            'Muhammed Nihal',
                            style: TextStyle(
                                color: colorBlack,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          kWidth5,
                          CustomCard(
                            width: 50,
                            height: 25,
                            borderRadius: 5,
                            color: const Color.fromARGB(255, 236, 235, 235),
                            child: const Text(
                              'Home',
                              style: TextStyle(
                                  color: colorGrey,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      kHeight10,
                      const Text(
                        '445,Kondotty,Edavannapara,678542',
                        style: TextStyle(
                          color: colorBlack,
                          fontSize: 15,
                        ),
                      ),
                      kHeight10,
                      const Text('6238961357'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
