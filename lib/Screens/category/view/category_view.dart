import 'package:e_commerce/Screens/category/view/widget/filteration_bar.dart';
import 'package:e_commerce/Screens/home/view/widget/grid_view.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:e_commerce/util/search_bar/search_bar.dart';
import 'package:flutter/material.dart';

class ScreenCategory extends StatelessWidget {
  const ScreenCategory({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: backgroundColor,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: colorWhite,
              ),
            ),
          ],
          backgroundColor: colorVailet,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Category',
                style: TextStyle(
                  letterSpacing: 3,
                  color: colorWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(height * 0.04),
            child: const SizedBox(),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.12,
                ),
                SearchBar(
                  width: width,
                  height: height,
                ),
                kHeight10,
                FilerationBar(width: width),
                kHeight20,
                Row(
                  children: const [
                    Expanded(
                      child: Text(
                        '166 Items',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text('sort by:'),
                    Text(
                      'Featured ⌄',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                kHeight20,
                ProductGridView(
                  width: width,
                  height: height,
                ),
              ],
            ),
          ),
        ));
  }
}
