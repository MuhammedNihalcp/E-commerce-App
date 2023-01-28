import 'package:e_commerce/Screens/account/controller/account_controller.dart';
import 'package:e_commerce/Screens/account/view/account_add.dart';
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Get.to(() => AddAccountPage(width: width,height: height,));
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
                    accountC.logout();
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
                    'Manage Your Profile',
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