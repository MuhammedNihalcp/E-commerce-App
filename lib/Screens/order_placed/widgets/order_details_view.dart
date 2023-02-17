import 'package:e_commerce/Screens/order_placed/widgets/order_cancel_widget.dart';
import 'package:e_commerce/Screens/order_placed/widgets/order_success_widget.dart';
import 'package:e_commerce/Screens/payment/controller/order_summery_controller/order_summery_controller.dart';
import 'package:e_commerce/common/api/api_baseurl.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetialsView extends StatelessWidget {
  const OrderDetialsView({
    super.key,
    required this.orderId,
    required this.index1,
  });

  final String orderId;
  final int index1;
  @override
  Widget build(BuildContext context) {
    OrderSummeryController ordersController = Get.put(OrderSummeryController());
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ordersController.getSingleOrder(orderId);
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: GetBuilder<OrderSummeryController>(
          builder: (controller) {
            return ordersController.isLoading == true ||
                    ordersController.singleModel == null
                ? SizedBox(
                    height: Get.size.height * 0.5,
                    child: const Center(child: CircularProgressIndicator()))
                : Column(
                    children: [
                      Card(
                        color: colorWhite,
                        shape: const OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide.none,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Order ID - ${ordersController.singleModel!.id.toUpperCase()}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: colorGrey,
                                  fontSize: 12,
                                ),
                              ),
                              divider,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ordersController.singleModel!
                                            .products[index1].product.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      kHeight10,
                                      Text(
                                        "₹${(ordersController.singleModel!.products[index1].product.price - ordersController.singleModel!.products[index1].product.discountPrice).round()}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Image(
                                    height: 80,
                                    width: 100,
                                    image: NetworkImage(
                                        '${ApiBaseUrl().baseUrl}/products/${ordersController.singleModel!.products[index1].product.image[4]}'),
                                  )
                                ],
                              ),
                              divider,
                              ordersController.singleModel!.orderStatus ==
                                      'CANCELED'
                                  ? OrderCanceldStatusWidget(index: index1)
                                  : OrderSucssesStatusWidget(index: index1),
                              divider,
                              GetBuilder<OrderSummeryController>(
                                builder: (controller) {
                                  return ordersController
                                              .singleModel!.orderStatus ==
                                          'CANCELED'
                                      ? Center(
                                          child: TextButton.icon(
                                            style: TextButton.styleFrom(
                                              foregroundColor:
                                                  Colors.grey.shade600,
                                            ),
                                            onPressed: () {
                                              ordersController
                                                  .sendOrderDetials();
                                            },
                                            icon: const Icon(
                                              Icons.share,
                                              size: 20,
                                            ),
                                            label: const Text(
                                              'Share Order Details',
                                            ),
                                          ),
                                        )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                foregroundColor:
                                                    Colors.grey.shade600,
                                              ),
                                              onPressed: () {
                                                ordersController
                                                    .cancelOrder(orderId);
                                                Get.back();
                                              },
                                              child: const Text('Cancel'),
                                            ),
                                            const VerticalDivider(
                                                endIndent: 20),
                                            TextButton.icon(
                                              style: TextButton.styleFrom(
                                                foregroundColor:
                                                    Colors.grey.shade600,
                                              ),
                                              onPressed: () {
                                                ordersController
                                                    .sendOrderDetials();
                                              },
                                              icon: const Icon(
                                                Icons.share,
                                                size: 20,
                                              ),
                                              label: const Text(
                                                'Share Order Details',
                                              ),
                                            )
                                          ],
                                        );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      GetBuilder<OrderSummeryController>(
                        builder: (controller) {
                          return Card(
                            color: colorWhite,
                            shape: const OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide: BorderSide.none,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Shopping Details",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: colorGrey,
                                      fontSize: 12,
                                    ),
                                  ),
                                  divider,
                                  Text(
                                    ordersController.singleModel!.fullName,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    ),
                                  ),
                                  kHeight5,
                                  Text(
                                      '${ordersController.singleModel!.address}\n${ordersController.singleModel!.place}\n${ordersController.singleModel!.state} - ${ordersController.singleModel!.pin}\nPhone Number: ${ordersController.singleModel!.phone}')
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
