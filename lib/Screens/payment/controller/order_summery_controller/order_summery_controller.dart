import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderSummeryController extends GetxController {
  int currentStep = 0;

  List<Step> steps = [
    const Step(
      // state: StepState.complete,
      title: Text(
        'Address',
        style: TextStyle(color: Colors.black),
      ),
      content: Text(
        '',
        style: TextStyle(color: Colors.blue),
      ),
      isActive: true,
    ),
    const Step(
        title: Text(
          'Order summery',
          style: TextStyle(color: Colors.black),
        ),
        content: Text(
          '',
          style: TextStyle(color: Colors.blue),
        ),
        isActive: true,
       ),
    const Step(
        title: Text(
          'Payment',
          style: TextStyle(color: Colors.black),
        ),
        content: Text(
          '',
          style: TextStyle(color: Colors.blue),
        ),
        isActive: true,
        // state: StepState.complete,
        )
  ];
  void onStepTap(step) {
    currentStep = step;
    update();
  }

  void onStepContinue() {
    if (currentStep < steps.length - 1) {
      currentStep = currentStep + 1;
      update();
    } else {
      currentStep = 0;
      update();
    }
  }

  onStepCancel() {
    if (currentStep > 0) {
      currentStep = currentStep - 1;
      update();
    } else {
      currentStep = 0;
      update();
    }
  }
}
