import 'package:e_commerce/Screens/account/controller/account_controller.dart';
import 'package:e_commerce/Screens/account/view/all_accounts_view/all_account_view.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:e_commerce/util/textfield/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class FormWidgets extends StatelessWidget {
  const FormWidgets({
    super.key,
    required this.accountC,
    required this.width,
    required this.height,
    required this.formKey,
  });

  final AcountController accountC;
  final double width;
  final double height;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kHeight10,
        TextFromFieldWidget(
          textController: accountC.tittleC,
          textInputType: TextInputType.name,
          nullText: 'Tittle is Empty',
          obscureText: false,
          icon: const Icon(Icons.person),
          text: 'Tittle',
        ),
        kHeight10,
        TextFromFieldWidget(
          textController: accountC.fullNameC,
          textInputType: TextInputType.name,
          nullText: 'Fullname is Empty',
          obscureText: false,
          icon: const Icon(Icons.person),
          text: 'Full Name',
        ),
        kHeight10,
        TextFromFieldWidget(
          textController: accountC.phoneC,
          textInputType: TextInputType.number,
          nullText: 'Phone number is Empty',
          obscureText: false,
          icon: const Icon(Icons.phone),
          text: 'Phone Number',
        ),
        kHeight10,
        TextFromFieldWidget(
          textController: accountC.pinC,
          textInputType: TextInputType.number,
          nullText: 'PinCode is Empty',
          obscureText: false,
          icon: const Icon(Icons.pin),
          text: 'PinCode',
        ),
        kHeight10,
        TextFromFieldWidget(
          textController: accountC.stateC,
          textInputType: TextInputType.name,
          nullText: 'State is Empty',
          obscureText: false,
          icon: const Icon(Icons.public),
          text: 'State',
        ),
        kHeight10,
        TextFromFieldWidget(
          textController: accountC.placeC,
          textInputType: TextInputType.name,
          nullText: 'Place is Empty',
          obscureText: false,
          icon: const Icon(Icons.location_on),
          text: 'Place',
        ),
        kHeight10,
        TextFromFieldWidget(
          textController: accountC.addressC,
          textInputType: TextInputType.streetAddress,
          nullText: 'Address is Empty',
          obscureText: false,
          icon: const Icon(Icons.contact_mail),
          text: 'Address',
        ),
        kHeight10,
        TextFromFieldWidget(
          textController: accountC.landmarkC,
          textInputType: TextInputType.name,
          nullText: 'LandMark is Empty',
          obscureText: false,
          icon: const Icon(Icons.emoji_flags),
          text: 'Delivary Location',
        ),
        kHeight10,
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(buttonColor),
            fixedSize: MaterialStateProperty.all(
              Size(width * 0.8, height * 0.08),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              accountC.addAccount();
              Get.off(
                () => AllAccountView(
                  width: width,
                  height: height,
                ),
              );
            }
          },
          child: const Text(
            'S U B M I T',
            style: buttonStyle,
          ),
        )
      ],
    );
  }
}
