import 'package:e_commerce/Screens/account/controller/account_controller.dart';
import 'package:e_commerce/Screens/account/view/all_accounts_view/all_account_view.dart';
import 'package:e_commerce/Screens/account_setting/view/account_setting.dart';
import 'package:e_commerce/Screens/home/controller/home_controller.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';

import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:get/get.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({
    Key? key,
    required this.height,
    required this.width,
    required this.value,
    required this.index,
  }) : super(key: key);

  final double height;
  final double width;
  final AcountController value;
  final int index;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      width: double.infinity,
      height: 180,
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
                  onPressed: () {
                    Get.to(() => AllAccountView(width: width, height: height));
                  },
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
                Text(
                  value.addressList[index].fullName.toUpperCase(),
                  style: const TextStyle(
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
                  child: Text(
                    value.addressList[index].title,
                    style: const TextStyle(
                        color: colorGrey, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            kHeight10,
            Text(
              '${value.addressList[index].state}, ${value.addressList[index].place}, ${value.addressList[index].pin}',
              style: const TextStyle(
                color: colorBlack,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            kHeight10,
            Text(
              value.addressList[index].phone,
              style:const TextStyle(
                color: colorBlack,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
