import 'package:flutter/material.dart';


class ScreenNewPassword extends StatelessWidget {
  const ScreenNewPassword({super.key,required this.email,});
  final String email;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('New password'),
      ),
    );
  }
}
