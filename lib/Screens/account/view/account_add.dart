import 'package:e_commerce/Screens/account/controller/account_controller.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:e_commerce/util/textfield/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAccountPage extends StatelessWidget {
  AddAccountPage({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;
  final accountC = Get.put(AcountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
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
              child: Column(
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
                    child: Text('Submit'),
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
