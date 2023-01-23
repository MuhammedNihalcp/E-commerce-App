import 'package:e_commerce/Screens/account/controller/account_controller.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:e_commerce/util/textfield/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAccountPage extends StatelessWidget {
  AddAccountPage({super.key});

  final accountC = Get.put(AcountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: GetBuilder<AcountController>(
        builder: (controller) => Form(
          child: Column(
            children: [
              TextFromFieldWidget(
                textController: accountC.tittleC,
                nullText: 'Tittle is Empty',
                obscureText: false,
                icon: const Icon(Icons.person),
                text: 'Tittle',
              ),
            ],
          ),
        ),
      )),
    );
  }
}


