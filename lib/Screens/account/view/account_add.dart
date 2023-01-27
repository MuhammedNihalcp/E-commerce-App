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
              TextFromFieldWidget(
                textController: accountC.fullNameC,
                nullText: 'Fullname is Empty',
                obscureText: false,
                icon: const Icon(Icons.person),
                text: 'Full Name',
              ),
              TextFromFieldWidget(
                textController: accountC.phoneC,
                nullText: 'Phone number is Empty',
                obscureText: false,
                icon: const Icon(Icons.phone),
                text: 'Phone Number',
              ),
              TextFromFieldWidget(
                textController: accountC.pinC,
                nullText: 'PinCode is Empty',
                obscureText: false,
                icon: const Icon(Icons.pin),
                text: 'PinCode',
              ),
              TextFromFieldWidget(
                textController: accountC.stateC,
                nullText: 'State is Empty',
                obscureText: false,
                icon: const Icon(Icons.public),
                text: 'State',
              ),
              TextFromFieldWidget(
                textController: accountC.placeC,
                nullText: 'Place is Empty',
                obscureText: false,
                icon: const Icon(Icons.location_on),
                text: 'Place',
              ),
              TextFromFieldWidget(
                textController: accountC.addressC,
                nullText: 'Address is Empty',
                obscureText: false,
                icon: const Icon(Icons.contact_mail),
                text: 'Address',
              ),
              TextFromFieldWidget(
                textController: accountC.landmarkC,
                nullText: 'LandMark is Empty',
                obscureText: false,
                icon: const Icon(Icons.emoji_flags),
                text: 'Delivary Location',
              ),
            ],
          ),
        ),
      )),
    );
  }
}
