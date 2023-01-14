import 'package:e_commerce/Screens/payment/controller/order_summery_controller/order_summery_controller.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenOrderSummery extends StatelessWidget {
  ScreenOrderSummery({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  final orderSC = Get.put(OrderSummeryController());

  @override
  Widget build(BuildContext context) {
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
          child: SingleChildScrollView(
        child: GetBuilder<OrderSummeryController>(
          builder: (controller) => Column(
            children: [
              SizedBox(
                child: Stepper(
                  steps: orderSC.steps,
                  currentStep: orderSC.currentStep,
                  type: StepperType.horizontal,
                  onStepTapped: (step) {
                    orderSC.onStepTap(step);
                  },
                  onStepContinue: () {
                    orderSC.onStepContinue();
                  },
                  onStepCancel: () {
                    orderSC.onStepCancel();
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
