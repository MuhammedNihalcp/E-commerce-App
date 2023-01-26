import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserNameImage extends StatelessWidget {
  const UserNameImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: RichText(
        maxLines: 1,
        text: const TextSpan(
          text: 'Hello, ',
          style: TextStyle(color: colorBlack, fontSize: 20),
          children: <TextSpan>[
            TextSpan(
                text: 'Muhammed Nihal',
                style: TextStyle(fontWeight: FontWeight.bold)),
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
    );
  }
}
