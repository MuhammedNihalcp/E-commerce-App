import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_commerce/util/error_popup/snack_bar.dart';
import 'package:flutter/material.dart';

class DioException {
  void dioError(Object e, BuildContext context) {
    if (e is DioError) {
      if (e.response?.statusCode == 401) {
        SnackBarPop.popUp(
          context,
          'Invalid username or password',
          Colors.red,
        );
      } else if (e.response?.statusCode == 400) {
        SnackBarPop.popUp(
          context,
          'All fields required',
          Colors.red,
        );
      } else if (e.response?.statusCode == 403) {
        SnackBarPop.popUp(
          context,
          'Forbidden',
          Colors.red,
        );
      } else if (e.response?.statusCode == 500) {
        SnackBarPop.popUp(
          context,
          'Something went wrong',
          Colors.red,
        );
      } else if (e.toString() ==
          "[Error]: (006) Request Throttled. Over Rate limit: up to 2 per sec. See geocode.xyz/pricing") {
        SnackBarPop.popUp(
          context,
          'Failed, Please try again',
          Colors.red,
        );
      }
    }
    if (e is SocketException) {
      SnackBarPop.popUp(context, 'No Internet Connection', Colors.red);
    } else if (e is TimeoutException) {
      SnackBarPop.popUp(context, 'Connection Timedout', Colors.red);
    }
  }
}

