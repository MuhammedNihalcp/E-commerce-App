import 'package:e_commerce/Screens/account/controller/account_controller.dart';
import 'package:e_commerce/Screens/account/view/all_accounts_view/all_account_view.dart';
import 'package:e_commerce/Screens/cart/controller/cart_controller.dart';
import 'package:e_commerce/Screens/payment/controller/order_summery_controller/order_summery_controller.dart';
import 'package:e_commerce/Screens/payment/controller/payment_controller/payment_controller.dart';
import 'package:e_commerce/Screens/payment/model/order_enum.dart';
import 'package:e_commerce/Screens/payment/view/order_summery/widget/bottom_widget/bottom_widget.dart';
import 'package:e_commerce/Screens/payment/view/order_summery/widget/order_details/order_details.dart';
import 'package:e_commerce/Screens/payment/view/order_summery/widget/order_productDetails/order_product_details.dart';

import 'package:e_commerce/Screens/payment/view/order_summery/widget/price_details/price_details.dart';
import 'package:e_commerce/Screens/payment/view/order_summery/widget/see_all_product/see_all_product.dart';


import 'package:e_commerce/core/text_style.dart';
import 'package:e_commerce/util/cricularProgressWidget/circular_progress_widget.dart';
import 'package:flutter/material.dart';


import 'package:get/get.dart';

// ignore: must_be_immutable
class ScreenOrderSummery extends StatelessWidget {
  ScreenOrderSummery({
    Key? key,
    required this.cartId,
    required this.productId,
    required this.screenCheck,
  }) : super(key: key);

  final String cartId;
  final String productId;
  final OrderScreenEnum screenCheck;

  double width = Get.size.width;
  double height = Get.size.height;

  OrderSummeryController orderSC = Get.put(OrderSummeryController());
  AcountController accountcontroller = Get.put(AcountController());
  CartController cartcontroller = Get.put(CartController());
  PaymentController paymentController = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      orderSC.getSingleCart(productId, cartId);

      paymentController.setAddressId(
          accountcontroller.addressList[accountcontroller.selectIndex].id);
      orderSC.productIds.insert(
          0,
          cartcontroller
              .cartitemsPayId[cartcontroller.cartitemsPayId.length - 1]);
    });
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: colorVailet,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Order',
              style: TextStyle(
                letterSpacing: 3,
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Summery',
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
      body: SafeArea(
        child: GetBuilder<AcountController>(
          builder: (controller) => GetBuilder<OrderSummeryController>(
            builder: (controller) => GetBuilder<CartController>(
              builder: (controller) => orderSC.isLoading == true
                  ? const CircularProgressWidget()
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          accountcontroller.addressList.isEmpty
                              ? InkWell(
                                  onTap: () {
                                    Get.to(
                                      AllAccountView(
                                        width: width,
                                        height: height,
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 100,
                                    child: Center(
                                      child: Text(
                                        'Add Address',
                                        style: gooleaborto,
                                      ),
                                    ),
                                  ),
                                )
                              : OrderDetails(
                                  value: accountcontroller,
                                  index: accountcontroller.selectIndex,
                                  height: height,
                                  width: width,
                                ),
                          screenCheck ==
                                  OrderScreenEnum.buyOneProductOrderScreen
                              ? OrderProductDetails(
                                  ordercontroller: orderSC,
                                  cartcontroller: cartcontroller,
                                  width: width,
                                  height: height,
                                  screenCheck: screenCheck,
                                )
                              : SizedBox(
                                  width: double.infinity,
                                  height: height * 0.2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Including all Products',
                                        style: gooleaborto,
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Get.to(() => SeeAllProductScreen());
                                        },
                                        child: const Text(
                                          'See All Products',
                                          style: TextStyle(color: colorBlack),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          PriceDetails(
                            ordercontroller: orderSC,
                            cartcontroller: cartcontroller,
                            screenCheck: screenCheck,
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: GetBuilder(
        init: paymentController,
        builder: (controller) => GetBuilder(
          init: accountcontroller,
          builder: (controller) => GetBuilder(
            init: orderSC,
            builder: (controller) => GetBuilder(
              init: cartcontroller,
              builder: (controller) => BottomWidget(
                width: width,
                height: height,
                ordercontroller: orderSC,
                cartcontroller: cartcontroller,
                paymentcontroller: paymentController,
                accountcontroller: accountcontroller,
                screencheck: screenCheck,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
