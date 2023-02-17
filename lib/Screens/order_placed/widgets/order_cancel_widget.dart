import 'package:e_commerce/Screens/payment/controller/order_summery_controller/order_summery_controller.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OrderCanceldStatusWidget extends StatelessWidget {
  const OrderCanceldStatusWidget({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    OrderSummeryController ordersController = Get.put(OrderSummeryController());
    return GetBuilder<OrderSummeryController>(
      builder: (controller) {
        final canceledDate = ordersController.formatDate(
            ordersController.ordersList![index].cancelDate.toString());
        final orderedDate = ordersController.formatCancelDate(
            ordersController.ordersList![index].orderDate.toString());
        return Row(
          children: [
            SizedBox(
              height: 240,
              width: 50,
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
                  Container(
                    height: 65,
                    width: 3,
                    color: colorWhite,
                  ),
                  const CircleAvatar(
                    backgroundColor: colorremoveSnack,
                    radius: 10,
                    child: Icon(
                      Icons.cancel,
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
                    height: 45,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Order Canceled'),
                      Text(
                        canceledDate ?? '12',
                        style: const TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
