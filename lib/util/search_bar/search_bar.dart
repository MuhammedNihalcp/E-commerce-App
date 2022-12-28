import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: ButtonStyle(
        alignment: Alignment.centerLeft,
        backgroundColor: MaterialStateProperty.all(colorWhite),
        fixedSize:
            MaterialStateProperty.all(Size(width, height * 0.05)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: const BorderSide(color: colorWhite),
          ),
        ),
      ),
      onPressed: () {},
      icon: const Icon(
        Icons.search,
        color: colorBlack,
      ),
      label: const Text(
        'What are you looking for?',
        style: TextStyle(color: colorBlack),
      ),
    );
  }
}