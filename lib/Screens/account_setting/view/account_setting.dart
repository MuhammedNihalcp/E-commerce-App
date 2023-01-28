import 'package:e_commerce/Screens/account/controller/account_controller.dart';
import 'package:e_commerce/Screens/account/view/account_add.dart';
import 'package:e_commerce/Screens/account_setting/view/widget/account_setting_widget.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenAccountSetting extends StatelessWidget {
  ScreenAccountSetting({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  final accountC = Get.put(AcountController());

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
              'Account',
              style: TextStyle(
                letterSpacing: 3,
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Settings',
              style: TextStyle(
                letterSpacing: 3,
                fontWeight: FontWeight.bold,
                color: colorBlack,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.cancel),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.04),
          child: const SizedBox(),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kHeight10,
                const Text(
                  'Account Settings',
                  style: accountTextStyle,
                ),
                kHeight20,
                AccountSettingWidget(
                  accountC: accountC,
                  width: width,
                  height: height,
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
