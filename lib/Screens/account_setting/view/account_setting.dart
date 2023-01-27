import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';

class ScreenAccountSetting extends StatelessWidget {
  ScreenAccountSetting({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  final List<String> accountNames = [
    'Your Addresses',
    'Logout',
    'Teams and contition',
    'Manage Your Profile',
    'Privacy Policy',
    'About',
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
              'Account',
              style: TextStyle(
                letterSpacing: 3,
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Settings',
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
            icon: const Icon(Icons.cancel),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.04),
          child: const SizedBox(),
        ),
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                    children: [
              kHeight10,
              const Text(
                'Account Settings',
                style: accountTextStyle,
              ),
              Container(
                width: double.infinity,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: lightgrey,
                  ),
                ),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(accountNames[index]),
                        ),
                        const Icon(Icons.arrow_forward_ios_rounded)
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 2,
                    );
                  },
                  itemCount: accountNames.length,
                ),
              )
                    ],
                  ),
            ),
          )),
    );
  }
}
