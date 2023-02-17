import 'package:e_commerce/Screens/payment/controller/order_summery_controller/order_summery_controller.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderSucssesStatusWidget extends StatelessWidget {
  const OrderSucssesStatusWidget({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    OrderSummeryController ordersController = Get.put(OrderSummeryController());
    return GetBuilder<OrderSummeryController>(
      builder: (controller) {
        final deliveryDate = ordersController.formatDate(
            ordersController.ordersList![index].deliveryDate.toString());
        final orderedDate = ordersController.formatCancelDate(
            ordersController.ordersList![index].orderDate.toString());
        return Row(
          children: [
            SizedBox(
              height: 250,
              width: 55,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 10,
                    child: Icon(
                      Icons.check,
                      size: 14,
                      color: colorWhite,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Container(
                    height: 52,
                    width: 2,
                    color: colorWhite,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  CircleAvatar(
                    backgroundColor:
                        ordersController.singleModel!.orderStatus ==
                                    'shipped' ||
                                ordersController.singleModel!.orderStatus ==
                                    'delivered'
                            ? Colors.green
                            : colorWhite,
                    radius: 10,
                    child: const Icon(
                      Icons.check,
                      size: 14,
                      color: colorWhite,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Container(
                    height: 54,
                    width: 2,
                    color: colorWhite,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  CircleAvatar(
                    backgroundColor:
                        ordersController.singleModel!.orderStatus == 'delivered'
                            ? Colors.green
                            : colorWhite,
                    radius: 10,
                    child: const Icon(
                      Icons.check,
                      size: 14,
                      color: colorWhite,
                    ),
                  ),
                ],
              ),
            ),
            kHeight20,
            SizedBox(
              height: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Order confirmed'),
                      Text(orderedDate.toString(),
                          style: const TextStyle(fontSize: 12))
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order Shipped',
                        style: ordersController.singleModel!.orderStatus ==
                                    'shipped' ||
                                ordersController.singleModel!.orderStatus ==
                                    'delivered'
                            ? const TextStyle()
                            : const TextStyle(
                                color: Colors.black38,
                              ),
                      ),
                      Text(
                        ordersController.singleModel!.orderStatus ==
                                    'shipped' ||
                                ordersController.singleModel!.orderStatus ==
                                    'delivered'
                            ? deliveryDate.toString()
                            : '',
                        style: ordersController.singleModel!.orderStatus ==
                                    'shipped' ||
                                ordersController.singleModel!.orderStatus ==
                                    'delivered'
                            ? const TextStyle(fontSize: 12)
                            : const TextStyle(
                                fontSize: 12,
                                color: Colors.black38,
                              ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Order Delivered',
                          style: ordersController.singleModel!.orderStatus ==
                                  'delivered'
                              ? const TextStyle()
                              : const TextStyle(color: Colors.black38)),
                      Text(
                        ordersController.singleModel!.orderStatus == 'delivered'
                            ? deliveryDate.toString()
                            : '',
                        style: ordersController.singleModel!.orderStatus ==
                                    'shipped' ||
                                ordersController.singleModel!.orderStatus ==
                                    'delivered'
                            ? const TextStyle(fontSize: 12)
                            : const TextStyle(
                                fontSize: 12, color: Colors.black38),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
