import 'dart:developer';

import 'package:e_commerce/Screens/cart/controller/cart_controller.dart';
import 'package:e_commerce/Screens/cart/view/widget/add_remove_button/add_remove_button.dart';
import 'package:e_commerce/Screens/cart/view/widget/cart_bottom_button/cart_bottom_button.dart';
import 'package:e_commerce/Screens/cart/view/widget/cart_image_detail/cart_image_details.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:get/get.dart';

class ScreenOrder extends StatelessWidget {
  ScreenOrder({super.key});

  // final cartC = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    CartController cartC = Get.put(CartController());
    double width = Get.size.width;
    double height = Get.size.height;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      cartC.getCart();
    });

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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.04),
          child: const SizedBox(),
        ),
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<CartController>(
            builder: (controller) => ListView.separated(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomCard(
                      onTap: () {
                        cartC.toProductScreen(index);
                      },
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
                              controller: cartC,
                              index: index,
                            ),
                            kHeight10,
                            AddAndRemoveButton(
                              height: height,
                              width: width,
                              totalConut: cartC.getmodel!.products[index].qty
                                  .toString(),
                              cartControllers: cartC,
                              index: index,
                              minusPressed: () {
                                cartC.incrementDecrementQty(
                                  -1,
                                  cartC.getmodel!.products[index].product.id,
                                  cartC.getmodel!.products[index].qty,
                                  cartC.getmodel!.products[index].size,
                                );
                              },
                              plusPressed: () {
                                cartC.incrementDecrementQty(
                                  1,
                                  cartC.getmodel!.products[index].product.id,
                                  cartC.getmodel!.products[index].qty,
                                  cartC.getmodel!.products[index].size,
                                );
                                log('plue');
                              },
                            ),
                            Row(
                              children: [
                                CartBottomButton(
                                  onPressed: () {
                                    cartC.removeCart(cartC
                                        .getmodel!.products[index].product.id);
                                  },
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
                itemCount: cartC.getmodel?.products.length ?? 0),
          ),
        ),
      ),
      bottomNavigationBar: GetBuilder(
        init: cartC,
        builder: (controller) => cartC.totalSave == 0 || cartC.totalSave == null||cartC.cartList.isEmpty
            ? const SizedBox()
            : Container(
                width: double.infinity,
                height: height * 0.1,
                color: colorWhite,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          kHeight5,
                          const Text(
                            'Total Price',
                            style: TextStyle(
                              color: colorBlack,
                              fontSize: 20,
                              fontFamily: "Manrope",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          kHeight5,
                          Text(
                            "₹${cartC.totalSave}",
                            style: const TextStyle(
                              color: colorremoveSnack,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(buttonColor),
                          fixedSize: MaterialStateProperty.all(
                            Size(width * 0.5, height * 0.07),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        onPressed: () {
                          // const OrderScreen(
                          //               cartId: "",
                          //               productId: "",
                          //               screenCheck:
                          //                   OrderScreenEnum.normalOrderScreen,
                          //             ),
                          //           );
                          //           ordersController.isLoading = false;
                        },
                        child: const Text(
                          'Place Order',
                          style: buttonStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
      // bottomNavigationBar: GetBuilder(
      //   // init: ordersController,
      //   builder: (controller) {
      //     return GetBuilder(
      //       init: cartC,
      //       builder: (controller) {
      //         return cartC.totalSave == 0 ||
      //                 cartC.totalSave == null
      //             ? const SizedBox()
      //             : Row(
      //                 children: [
      //                   Material(
      //                     elevation: 10,
      //                     child: SizedBox(
      //                         height: Get.size.height * 0.07,
      //                         width: Get.size.width / 2,
      //                         child: Column(
      //                           children: [
      //                             const Text(
      //                               'Total Price',
      //                               style: TextStyle(
      //                                 color: colorBlack,
      //                                 fontSize: 15,
      //                                 fontFamily: "Manrope",
      //                                 fontWeight: FontWeight.bold,
      //                               ),
      //                             ),
      //                             Text(
      //                               '₹${cartC.totalSave}',
      //                               style: const TextStyle(
      //                                 color: colorremoveSnack,
      //                                 fontFamily: 'Manrope',
      //                                 fontWeight: FontWeight.bold,
      //                                 fontSize: 18,
      //                               ),
      //                             ),
      //                           ],
      //                         )),
      //                   ),
      //                   SizedBox(
      //                     height: Get.size.height * 0.07,
      //                     width: Get.size.width / 2,
      //                     child: ElevatedButton(
      //                       onPressed: () {
      //                         // Get.to(
      //                         //   const OrderScreen(
      //                         //     cartId: "",
      //                         //     productId: "",
      //                         //     screenCheck:
      //                         //         OrderScreenEnum.normalOrderScreen,
      //                         //   ),
      //                         // );
      //                         // ordersController.isLoading = false;
      //                       },
      //                       style: ElevatedButton.styleFrom(
      //                           backgroundColor: Colors.blue,
      //                           elevation: 1,
      //                           shape: const RoundedRectangleBorder()),
      //                       child: const Text(
      //                         'Place Order',
      //                         style: TextStyle(
      //                           color: colorWhite,
      //                           fontFamily: 'Manrope',
      //                           letterSpacing: 1,
      //                           fontWeight: FontWeight.bold,
      //                           fontSize: 18,
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               );
      //       },
      //     );
      //   },
      // ),
    );
  }
}
