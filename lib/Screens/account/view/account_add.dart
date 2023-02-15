import 'package:e_commerce/Screens/account/controller/account_controller.dart';
import 'package:e_commerce/Screens/account/model/enum_account.dart';

import 'package:e_commerce/core/text_style.dart';
import 'package:e_commerce/Screens/account/view/widget/add_account_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAccountPage extends StatelessWidget {
  AddAccountPage({
    super.key,
    required this.width,
    required this.height,
    this.addressId = '',
    required this.addressScreenCheck,
  });

  final double width;
  final double height;
  final accountC = Get.put(AcountController());
  final fromKey = GlobalKey<FormState>();
  final EnumAddress addressScreenCheck;
  final String addressId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorVailet,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Add',
              style: TextStyle(
                letterSpacing: 3,
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Account',
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
          child: GetBuilder<AcountController>(
        builder: (controller) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: fromKey,
              child: FormWidgets(
                accountC: accountC,
                width: width,
                height: height,
                formKey: fromKey,
                addressId: addressId,
                addressScreenCheck: addressScreenCheck,
              ),
            ),
          ),
        ),
      )),
    );
  }
}


