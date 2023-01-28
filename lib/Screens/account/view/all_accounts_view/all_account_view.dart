import 'package:e_commerce/Screens/account/controller/account_controller.dart';
import 'package:e_commerce/Screens/account/view/account_add.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:e_commerce/util/cricularProgressWidget/circular_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AllAccountView extends StatelessWidget {
  AllAccountView({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  final accountC = Get.put(AcountController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      accountC.getAllAddress();
    });
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
        child: GetBuilder<AcountController>(
          builder: (controller) {
            return accountC.isLoading == true || accountC.isLoading2 == true
                ? const CircularProgressWidget()
                : accountC.addressList.isEmpty
                    ? Center(
                        child: Text(
                          'No Address',
                          style:
                              GoogleFonts.aboreto(textStyle: accountTextStyle),
                        ),
                      )
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: double.infinity,
                              height: height * 0.35,
                              decoration: BoxDecoration(
                                  color: colorWhite,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: lightgrey)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: const TextSpan(
                                        text: ' ',
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '  My',
                                              style: TextStyle(
                                                  backgroundColor: colorVailet,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.yellow)),
                                          TextSpan(
                                              text: ' Shop    ',
                                              style: TextStyle(
                                                  backgroundColor: colorVailet,
                                                  fontWeight: FontWeight.bold,
                                                  color: colorBlack)),
                                        ],
                                      ),
                                    ),
                                    kHeight5,
                                    const Divider(
                                      thickness: 2,
                                    ),
                                    kHeight5,
                                    Text(
                                      accountC.addressList[index].fullName,
                                      style: const TextStyle(
                                          color: colorBlack,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    kHeight5,
                                    Text(accountC.addressList[index].state),
                                    kHeight5,
                                    Text(
                                        '${accountC.addressList[index].place},${accountC.addressList[index].pin}'),
                                    kHeight5,
                                    Text(
                                        'Phone number: ${accountC.addressList[index].phone}'),
                                    kHeight5,
                                    Text(
                                        'Delivary location: ${accountC.addressList[index].landMark}'),
                                    kHeight10,
                                    Row(
                                      children: [
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            side: const BorderSide(
                                              color: lightgrey,
                                            ),
                                            minimumSize: Size(
                                              width * 0.2,
                                              height * 0.06,
                                            ),
                                          ),
                                          onPressed: () {
                                            accountC.deleteAddress(
                                                accountC.addressList[index].id);
                                          },
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
                        itemCount: accountC.addressList.length,
                      );
          },
        ),
      ),
    );
  }
}
