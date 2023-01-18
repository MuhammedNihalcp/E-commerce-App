import 'package:e_commerce/Screens/home/controller/home_controller.dart';
import 'package:e_commerce/Screens/home/view/widget/grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:get/get.dart';

class CustomSerchDelegate extends SearchDelegate {
  final homeC = Get.put(HomeContorller());
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(
            Icons.clear_outlined,
            color: Colors.black,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(
          Icons.arrow_back_sharp,
          color: Colors.black,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    double width = Get.size.width;
    double height = Get.size.height;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: CustomCard(
          elevation: 0,
          color: const Color.fromARGB(255, 216, 212, 212),
          width: width * 0.98,
          height: height * 0.96,
          borderRadius: 20,
          child: GetBuilder<HomeContorller>(
            builder: (controller) => SingleChildScrollView(
              child: ProductGridView(
                width: width,
                height: height,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    double width = Get.size.width;
    double height = Get.size.height;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          child: CustomCard(
            elevation: 0,
            color: const Color.fromARGB(255, 216, 212, 212),
            width: width * 0.98,
            height: height * 0.96,
            borderRadius: 20,
            child: GetBuilder<HomeContorller>(
              builder: (controller) => ProductGridView(
                width: width,
                height: height,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


