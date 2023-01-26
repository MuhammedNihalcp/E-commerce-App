import 'package:e_commerce/Screens/account/view/widget/text_button_widget.dart';
import 'package:flutter/widgets.dart';

class AccountButtonWidget extends StatelessWidget {
  const AccountButtonWidget({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButtonWidget(
          width: width,
          height: height,
          text: 'Your Account',
          onPressed: () {},
        ),
        TextButtonWidget(
          width: width,
          height: height,
          text: 'Your Cart',
          onPressed: () {},
        ),
      ],
    );
  }
}
