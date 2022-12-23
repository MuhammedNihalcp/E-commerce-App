import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 2,
        backgroundColor: colorVailet,
        title: Row(
          children: const[
            Text(
              'My',
              style: TextStyle(
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Shop',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: colorBlack,
              ),
            )
          ],
        ),
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
