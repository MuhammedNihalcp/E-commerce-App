import 'package:e_commerce/Screens/auth/sign_up/controller/register_verification_otp/controller.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserNameImage extends StatelessWidget {
  UserNameImage({
    Key? key,
  }) : super(key: key);

  final user = Get.put(VerifyOtpController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerifyOtpController>(
      builder: (controller) => ListTile(
        title: RichText(
          maxLines: 1,
          text: TextSpan(
            text: 'Hello, ',
            style: const TextStyle(color: colorBlack, fontSize: 20),
            children: <TextSpan>[
              TextSpan(
                  text: user.userModel?.fullname,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        trailing: const CircleAvatar(
          radius: 40,
          backgroundColor: colorWhite,
          child: Icon(
            Icons.person_rounded,
            color: colorBlack,
          ),
        ),
      ),
    );
  }
}
