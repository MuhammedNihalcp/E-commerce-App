

import 'package:e_commerce/Screens/account/controller/account_controller.dart';
import 'package:e_commerce/Screens/account/view/all_accounts_view/all_account_view.dart';
import 'package:e_commerce/Screens/cart/controller/cart_controller.dart';
import 'package:e_commerce/Screens/cart/view/widget/add_remove_button/add_remove_button.dart';

import 'package:e_commerce/Screens/cart/view/widget/cart_image_detail/cart_image_details.dart';
import 'package:e_commerce/Screens/cart/view/widget/cart_shimmer/cart_shimmer.dart';

import 'package:e_commerce/Screens/payment/controller/order_summery_controller/order_summery_controller.dart';
import 'package:e_commerce/Screens/payment/model/order_enum.dart';
import 'package:e_commerce/Screens/payment/view/order_summery/order_summery.dart';
import 'package:e_commerce/Screens/wishlist/controller/wishlist_controller.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ScreenOrder extends StatelessWidget {
  ScreenOrder({super.key});

  // final cartC = Get.put(CartController());

  final wishlistcontroller = Get.put(WishListController());
  OrderSummeryController ordercontroller = OrderSummeryController();
  AcountController accountcontroller = AcountController();

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
          child: GetBuilder(
            init: accountcontroller,
            builder: (controller) => GetBuilder<CartController>(
              builder: (controller) => GetBuilder(
                init: ordercontroller,
                builder: (controller) => cartC.isLoading == true
                    ? const CartShimmer()
                    : cartC.cartList.isEmpty
                        ? Center(
                            child: Text(
                              'No Cart Items',
                              style: gooleaborto,
                            ),
                          )
                        : ListView.separated(
                            itemBuilder: (context, index) {
                              return cartC.getmodel == null ||
                                      cartC.getmodel!.products.isEmpty
                                  ? SizedBox(
                                      height: height * 0.4,
                                      child: const Center(
                                        child: Text('Cart is Empty'),
                                      ),
                                    )
                                  : Padding(
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
                                                cartControllers: cartC,
                                                index: index,
                                              ),
                                              kHeight10,
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  GetBuilder<
                                                      WishListController>(
                                                    builder: (controller) =>
                                                        ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor: wishlistcontroller
                                                                      .wishList
                                                                      .contains(cartC
                                                                          .getmodel!
                                                                          .products[
                                                                              index]
                                                                          .product
                                                                          .id)
                                                                  ? Colors.red
                                                                  : colorWhite,
                                                              fixedSize: Size(
                                                                  width * 0.4,
                                                                  height *
                                                                      0.03),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                              side:
                                                                  const BorderSide(
                                                                width: 1,
                                                                color:
                                                                    colorLightGrey,
                                                              )),
                                                      onPressed: () {
                                                        wishlistcontroller
                                                            .addOrRemoveFromWishlist(
                                                                cartC
                                                                    .getmodel!
                                                                    .products[
                                                                        index]
                                                                    .product
                                                                    .id);
                                                      },
                                                      child: Text(
                                                        wishlistcontroller
                                                                .wishList
                                                                .contains(cartC
                                                                    .getmodel!
                                                                    .products[
                                                                        index]
                                                                    .product
                                                                    .id)
                                                            ? 'Remove WishList'
                                                            : 'Add WishList',
                                                        style: TextStyle(
                                                            color: wishlistcontroller
                                                                    .wishList
                                                                    .contains(cartC
                                                                        .getmodel!
                                                                        .products[
                                                                            index]
                                                                        .product
                                                                        .id)
                                                                ? colorWhite
                                                                : colorBlack),
                                                      ),
                                                    ),
                                                  ),
                                                  kWidth10,
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          buttonColor,
                                                      fixedSize: Size(
                                                        width * 0.4,
                                                        height * 0.03,
                                                      ),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      side: const BorderSide(
                                                        width: 1,
                                                        color: colorLightGrey,
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      ordercontroller
                                                          .isLoading = true;
                                                      accountcontroller
                                                              .addressList
                                                              .isEmpty
                                                          ? Get.to(
                                                              AllAccountView(
                                                                  width: width,
                                                                  height:
                                                                      height))
                                                          : ordercontroller
                                                              .toOrderScreen(
                                                              cartC
                                                                  .getmodel!
                                                                  .products[
                                                                      index]
                                                                  .product
                                                                  .id,
                                                              cartC
                                                                  .getmodel!.id,
                                                            );
                                                    },
                                                    child: const Text(
                                                      'Buy Now',
                                                      style: TextStyle(
                                                          color: colorBlack),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(),
                            itemCount: cartC.getmodel?.products.length ?? 0),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: GetBuilder(
        init: cartC,
        builder: (controller) => cartC.totalSave == 0 ||
                cartC.totalSave == null ||
                cartC.cartList.isEmpty
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
                          Get.to(() => ScreenOrderSummery(
                                cartId: "",
                                productId: "",
                                screenCheck: OrderScreenEnum.normalOrderScreen,
                              ));

                          ordercontroller.isLoading = false;
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
