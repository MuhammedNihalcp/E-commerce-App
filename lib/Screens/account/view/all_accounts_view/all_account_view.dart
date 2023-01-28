import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';

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
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: height * 0.25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: lightgrey)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Muhammed Nihal',
                          style: TextStyle(
                              color: colorBlack, fontWeight: FontWeight.bold),
                        ),
                        Text('Kerala'),
                        Text('Edavannapara,irrupantodi,673645'),
                        Text('Phone number: 623861357'),
                        Text('Delivary location: irrupnatodi'),
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
