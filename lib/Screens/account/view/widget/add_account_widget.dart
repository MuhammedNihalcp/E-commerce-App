import 'package:e_commerce/Screens/account/controller/account_controller.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:e_commerce/util/textfield/textfield.dart';
import 'package:flutter/material.dart';

class FormWidgets extends StatelessWidget {
  const FormWidgets({
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
    return Column(
      children: [
        kHeight10,
        TextFromFieldWidget(
          textController: accountC.tittleC,
          nullText: 'Tittle is Empty',
          obscureText: false,
          icon: const Icon(Icons.person),
          text: 'Tittle',
        ),
        kHeight10,
        TextFromFieldWidget(
          textController: accountC.fullNameC,
          nullText: 'Fullname is Empty',
          obscureText: false,
          icon: const Icon(Icons.person),
          text: 'Full Name',
        ),
        kHeight10,
        TextFromFieldWidget(
          textController: accountC.phoneC,
          nullText: 'Phone number is Empty',
          obscureText: false,
          icon: const Icon(Icons.phone),
          text: 'Phone Number',
        ),
        kHeight10,
        TextFromFieldWidget(
          textController: accountC.pinC,
          nullText: 'PinCode is Empty',
          obscureText: false,
          icon: const Icon(Icons.pin),
          text: 'PinCode',
        ),
        kHeight10,
        TextFromFieldWidget(
          textController: accountC.stateC,
          nullText: 'State is Empty',
          obscureText: false,
          icon: const Icon(Icons.public),
          text: 'State',
        ),
        kHeight10,
        TextFromFieldWidget(
          textController: accountC.placeC,
          nullText: 'Place is Empty',
          obscureText: false,
          icon: const Icon(Icons.location_on),
          text: 'Place',
        ),
        kHeight10,
        TextFromFieldWidget(
          textController: accountC.addressC,
          nullText: 'Address is Empty',
          obscureText: false,
          icon: const Icon(Icons.contact_mail),
          text: 'Address',
        ),
        kHeight10,
        TextFromFieldWidget(
          textController: accountC.landmarkC,
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
          onPressed: () {},
          child: const Text(
            'S U B M I T',
            style: buttonStyle,
          ),
        )
      ],
    );
  }
}
