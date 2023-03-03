import 'package:e_commerce/Screens/account/controller/account_controller.dart';

import 'package:e_commerce/Screens/account/view/all_accounts_view/all_account_view.dart';
import 'package:e_commerce/Screens/order_placed/view/order_placed_screen.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountSettingWidget extends StatelessWidget {
  const AccountSettingWidget({
    super.key,
    required this.accountC,
    required this.width,
    required this.height,
  });

  final AcountController accountC;

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: lightgrey,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () {
                Get.to(
                  () => AllAccountView(
                    width: width,
                    height: height,
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.to(
                        () => AllAccountView(
                          width: width,
                          height: height,
                        ),
                      );
                    },
                    child: const Text(
                      'Your Address',
                      style: accountsettingTextstyle,
                    ),
                  ),
                  arrowIcon
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () {
                accountC.logout();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.defaultDialog(
                        title: 'Tips',
                        middleText: 'Conform to logout',
                        backgroundColor: colorVailet,
                        titleStyle: const TextStyle(color: colorWhite),
                        middleTextStyle: const TextStyle(color: colorGrey),
                        confirm: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(buttonColor),
                            fixedSize: MaterialStateProperty.all(
                              Size(width * 0.4, height * 0.05),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          onPressed: () {
                            accountC.logout();
                          },
                          child: const Text(
                            'Conform',
                            style: buttonStyle,
                          ),
                        ),
                        cancel: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            fixedSize: MaterialStateProperty.all(
                              Size(width * 0.4, height * 0.05),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                side: const BorderSide(color: buttonColor,width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text(
                            'Cancel',
                            style: buttonStyle,
                          ),
                        ),
                      );

                      // accountC.logout();
                    },
                    child: const Text(
                      'Logout',
                      style: accountsettingTextstyle,
                    ),
                  ),
                  arrowIcon
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Get.to(() => const OrderPlacedScreen());
                  },
                  child: const Text(
                    'Your Order',
                    style: accountsettingTextstyle,
                  ),
                ),
                arrowIcon
              ],
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Terms & Contition',
                    style: accountsettingTextstyle,
                  ),
                ),
                arrowIcon
              ],
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Privacy Notice',
                    style: accountsettingTextstyle,
                  ),
                ),
                arrowIcon
              ],
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'About',
                    style: accountsettingTextstyle,
                  ),
                ),
                arrowIcon
              ],
            ),
          ),
        ],
      ),
    );
  }
}
