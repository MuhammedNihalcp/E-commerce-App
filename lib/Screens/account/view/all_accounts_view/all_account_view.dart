import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';

class AllAccountView extends StatelessWidget {
  const AllAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Container();
            },
            separatorBuilder: (context, index) {
              return SizedBox();
            },
            itemCount: 10),
      ),
    );
  }
}
