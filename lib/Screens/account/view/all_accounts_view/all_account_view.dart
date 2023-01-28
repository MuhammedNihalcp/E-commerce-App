import 'package:e_commerce/Screens/account/view/account_add.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllAccountView extends StatelessWidget {
  const AllAccountView({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.to(
                () => AddAccountPage(
                  width: width,
                  height: height,
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
        backgroundColor: colorVailet,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'All',
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.04),
          child: const SizedBox(),
        ),
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  height: height * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: lightgrey)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        kHeight5,
                        Text(
                          'Muhammed Nihal',
                          style: TextStyle(
                              color: colorBlack, fontWeight: FontWeight.bold),
                        ),
                        kHeight5,
                        Text('Kerala'),
                        kHeight5,
                        Text('Edavannapara,irrupantodi,673645'),
                        kHeight5,
                        Text('Phone number: 623861357'),
                        kHeight5,
                        Text('Delivary location: irrupnatodi'),
                        kHeight10,
                        Row(
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                side: const BorderSide(
                                  color: lightgrey,
                                ),
                                minimumSize: Size(
                                  width * 0.2,
                                  height * 0.06,
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Edit',
                                style: accountButtonStyle,
                              ),
                            ),
                            kWidth20,
                            TextButton(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                side: const BorderSide(
                                  color: lightgrey,
                                ),
                                minimumSize: Size(
                                  width * 0.2,
                                  height * 0.06,
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Remove',
                                style: accountButtonStyle,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox();
            },
            itemCount: 10),
      ),
    );
  }
}
