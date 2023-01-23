import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextFromFieldWidget extends StatelessWidget {
  const TextFromFieldWidget({
    Key? key,
    required this.textController,
    required this.nullText,
    required this.obscureText,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final TextEditingController textController;
  final String nullText;
  final bool obscureText;
  final Widget icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return nullText;
        } else {
          return null;
        }
      },
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {},
          icon: icon,
          color: colorBlack,
        ),
        label: Text(
          text,
          style: const TextStyle(color: colorBlack),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(20)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(20)),
        disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(20)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(20)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
