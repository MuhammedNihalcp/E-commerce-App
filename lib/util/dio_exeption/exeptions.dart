import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_commerce/core/text_style.dart';

import 'package:get/get.dart';

class DioException {
  void dioError(Object e) {
    if (e is DioError) {
      if (e.response?.statusCode == 401) {
        Get.snackbar('Incorrect', "Invalid username or password",
            colorText: colorremoveSnack);
      } else if (e.response?.statusCode == 400) {
        Get.snackbar('Error', "All field required",
            colorText: colorremoveSnack);
      } else if (e.response?.statusCode == 403) {
        Get.snackbar(
          'Forbidden',
          "Please logout",
          colorText: colorremoveSnack,
        );
      } else if (e.response?.statusCode == 500) {
        Get.snackbar(
          'Error',
          "Something went wrong",
          colorText: colorremoveSnack,
        );
      } else if (e.toString() ==
          "[Error]: (006) Request Throttled. Over Rate limit: up to 2 per sec. See geocode.xyz/pricing") {
        Get.snackbar(
          'Error',
          "Failed, Please try again",
          colorText: colorremoveSnack,
        );
      }
    }
    if (e is SocketException) {
      Get.snackbar(
        'Network',
        "No Internet Connection",
        colorText: colorremoveSnack,
      );
    } else if (e is TimeoutException) {
      Get.snackbar(
        'Connection',
        "Connection Timedout",
        colorText: colorremoveSnack,
      );
    }
  }
}
