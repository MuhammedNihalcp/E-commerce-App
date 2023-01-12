import 'package:e_commerce/Screens/cart/view/widget/cart_bottom_button/cart_bottom_button.dart';
import 'package:e_commerce/Screens/cart/view/widget/cart_image_detail/cart_image_details.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';

class ScreenOrder extends StatelessWidget {
  const ScreenOrder({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorVailet,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'My',
              style: TextStyle(
                letterSpacing: 3,
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Cart',
              style: TextStyle(
                letterSpacing: 3,
                fontWeight: FontWeight.bold,
                color: colorBlack,
              ),
            )
          ],
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.04),
          child: const SizedBox(),
        ),
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomCard(
                  width: double.infinity,
                  height: height * 0.39,
                  color: colorWhite,
                  borderRadius: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CartImageAndDetails(
                          width: width,
                          height: height,
                        ),
                        kHeight10,
                        Row(
                          children: [
                            Container(
                              height: height * 0.05,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 238, 237, 237),
                                  border: Border.all(color: colorLightGrey),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: Row(
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        backgroundColor: const Color.fromARGB(
                                            255, 238, 237, 237),
                                        minimumSize:
                                            Size(width * 0.05, height * 0.05)),
                                    onPressed: () {},
                                    child: const Icon(
                                      Icons.delete_outline,
                                      color: colorBlack,
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.13,
                                    // height: height * 0.05,
                                    color: const Color.fromARGB(
                                        255, 223, 220, 220),
                                    child: const Center(
                                        child: Text(
                                      '2',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          backgroundColor: const Color.fromARGB(
                                              255, 238, 237, 237),
                                          minimumSize: Size(
                                              width * 0.05, height * 0.05)),
                                      onPressed: () {},
                                      child: const Icon(
                                        Icons.add,
                                        color: colorBlack,
                                      ))
                                ],
                              ),
                            ),
                            kWidth10,
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  backgroundColor: colorWhite,
                                  minimumSize: Size(width * 0.2, height * 0.05),
                                  side: const BorderSide(
                                    width: 1,
                                    color: colorLightGrey,
                                  )),
                              onPressed: () {},
                              child: const Text(
                                'Delete',
                                style: TextStyle(color: colorBlack),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            CartBottomButton(
                              onPressed: () {},
                              text: 'Save for later',
                            ),
                            kWidth10,
                            CartBottomButton(
                              onPressed: () {},
                              text: 'See more like this',
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(),
            itemCount: 5),
      )),
    );
  }
}


