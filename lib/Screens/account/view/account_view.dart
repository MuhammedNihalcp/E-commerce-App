import 'dart:developer';

import 'package:e_commerce/Screens/account/controller/account_controller.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenAccount extends StatelessWidget {
  ScreenAccount({Key? key, required this.width, required this.height})
      : super(key: key);

  final accoutC = Get.put(AcountController());
  final double width;
  final double height;

  final order = [
    'https://m.media-amazon.com/images/I/619l+9g92kL._AC_SX679_.jpg',
    'https://m.media-amazon.com/images/I/81JIcyPY3CL._AC_UY679_.jpg',
  ];

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
              'My',
              style: TextStyle(
                letterSpacing: 3,
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Account',
              style: TextStyle(
                letterSpacing: 3,
                fontWeight: FontWeight.bold,
                color: colorBlack,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              // cartC.goToCartFromProduct();
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.04),
          child: const SizedBox(),
        ),
      ),
      body: GetBuilder<AcountController>(
        builder: (controller) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  kHeight20,
                  const UserNameImage(),
                  kHeight10,
                  AccountButton(
                    width: width,
                    height: height,
                  ),
                  kHeight10,
                  AccountButtonWidget(
                    width: width,
                    height: height,
                  ),
                  const YourAccountDetails(),
                  kHeight10,
                  YourAccountDetailsImages(
                    height: height,
                    order: order,
                    width: width,
                  ),
                  kHeight20,
                  const YourCartList(),
                  YourCartListImages(
                    height: height,
                    width: width,
                    order: order,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class YourCartListImages extends StatelessWidget {
  const YourCartListImages({
    Key? key,
    required this.height,
    required this.width,
    required this.order,
  }) : super(key: key);

  final double height;
  final double width;
  final List<String> order;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: Center(
        child: ListTile(
          title: const Text('Shopping List'),
          subtitle: const Text(
            'private.Degault',
            style: TextStyle(
              color: lightgrey,
            ),
          ),
          trailing: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              width: width * 0.4,
              height: height * 0.18,
              image: NetworkImage(order[0]),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class YourCartList extends StatelessWidget {
  const YourCartList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Your Cart List',
          style: accountTextStyle,
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'See all',
            style: accountSeeall,
          ),
        ),
      ],
    );
  }
}

class YourAccountDetailsImages extends StatelessWidget {
  const YourAccountDetailsImages({
    Key? key,
    required this.height,
    required this.order,
    required this.width,
  }) : super(key: key);

  final double height;
  final List<String> order;
  final double width;

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: height * 0.18,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          order.length,
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
                  image: NetworkImage(order[index]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class YourAccountDetails extends StatelessWidget {
  const YourAccountDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Your Orders',
          style: accountTextStyle,
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'See all',
            style: accountSeeall,
          ),
        ),
      ],
    );
  }
}

class AccountButtonWidget extends StatelessWidget {
  const AccountButtonWidget({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButtonWidget(
          width: width,
          height: height,
          text: 'Your Account',
          onPressed: () {},
        ),
        TextButtonWidget(
          width: width,
          height: height,
          text: 'Your Cart',
          onPressed: () {},
        ),
      ],
    );
  }
}

class AccountButton extends StatelessWidget {
  const AccountButton({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            side: const BorderSide(
              width: 1,
              color: colorGrey,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            minimumSize: Size(
              width * 0.4,
              height * 0.08,
            ),
          ),
          onPressed: () {},
          child: const Text(
            'Buy Again',
            style: TextStyle(color: colorBlack),
          ),
        ),
        TextButtonWidget(
          width: width,
          height: height,
          text: 'Your Order',
          onPressed: () {},
        ),
      ],
    );
  }
}

class UserNameImage extends StatelessWidget {
  const UserNameImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: RichText(
        maxLines: 1,
        text: const TextSpan(
          text: 'Hello, ',
          style: TextStyle(color: colorBlack, fontSize: 20),
          children: <TextSpan>[
            TextSpan(
                text: 'Muhammed Nihal',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      trailing: const CircleAvatar(
        radius: 40,
        backgroundColor: colorWhite,
        child: Icon(
          Icons.person_rounded,
          color: colorBlack,
        ),
      ),
    );
  }
}

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final double width;
  final double height;

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        side: const BorderSide(
          width: 1,
          color: colorGrey,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        minimumSize: Size(
          width * 0.4,
          height * 0.08,
        ),
      ),
      onPressed: () {
        log('on press', name: '1');
        onPressed;
        log('2');
      },
      child: Text(
        text,
        style: const TextStyle(color: colorBlack),
      ),
    );
  }
}
