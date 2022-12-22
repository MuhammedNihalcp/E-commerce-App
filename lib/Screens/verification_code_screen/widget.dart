import 'package:flutter/material.dart';

class TextEditorForPhoneVerify extends StatelessWidget {
  const TextEditorForPhoneVerify({super.key});

  //  final TextEditingController code;

  //  TextEditorForPhoneVerify(this.code);

   @override
   Widget build(BuildContext context) {
     return TextField(
       textAlign: TextAlign.center,
       keyboardType: TextInputType.number,
      //  controller: this.code,
       maxLength: 1,
       cursorColor: Theme.of(context).primaryColor,
       decoration: const InputDecoration(
         hintText: "*",
         counterText: '',
         hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)
       )
    );
  }
}