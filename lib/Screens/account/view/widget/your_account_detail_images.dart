import 'package:e_commerce/Screens/payment/controller/order_summery_controller/order_summery_controller.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class YourAccountDetailsImages extends StatelessWidget {
  YourAccountDetailsImages({
    Key? key,
    required this.height,
    required this.order,
    required this.width,
  }) : super(key: key);

  final double height;
  final List<String> order;
  final double width;
  OrderSummeryController ordercontroller = Get.put(OrderSummeryController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderSummeryController>(
      builder: (controller) => ordercontroller.ordersList!.isEmpty
          ? SizedBox(
              height: height * 0.1,
              child: Center(
                child: Text(
                  'Your order is Empty',
                  style: gooleaborto,
                ),
              ),
            )
          : LimitedBox(
              maxHeight: height * 0.18,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  ordercontroller.ordersList!.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      // color: colorGrey,
                      width: width * 0.5,
                      height: height * 0.18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: borderColor,
                        ),
                        color: colorWhite,
                        image: DecorationImage(
                          image: NetworkImage(ordercontroller.ordersList![index]
                              .products[index].product.image[0]),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
