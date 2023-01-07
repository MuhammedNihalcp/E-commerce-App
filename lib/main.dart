import 'package:e_commerce/Screens/product_view_screen/view/product_view.dart';
import 'package:e_commerce/Screens/splash_screen/view/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: ScreenSplash(),

      unknownRoute: GetPage(
          name: ScreenProductView.routeName, page: () => ScreenSplash()),
      // initialRoute: ScreenProductView.routeName,
      getPages: [
        GetPage(
            name: ScreenProductView.routeName, page: () => ScreenProductView())
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
