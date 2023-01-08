import 'package:e_commerce/Screens/category/controller/filteration_bar_controller.dart';
import 'package:e_commerce/Screens/home/controller/home_controller.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilerationBar extends StatelessWidget {
  FilerationBar({Key? key, required this.width}) : super(key: key);

  final double width;

  final filterationC = Get.put(FilterationBarController());

  // final List<String> categories = [
  //   'All',
  //   'Dresses',
  //   'Tops',
  //   'Jeans',
  //   'Sweaters',
  //   'Cotton pands',
  //   'Shirt',
  // ];

  @override
  Widget build(BuildContext context) {
    final categoryItems = Get.put(HomeContorller(context));
    return GetBuilder<FilterationBarController>(
      builder: (controller) => SizedBox(
        height: 40,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryItems.categoryList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        filterationC.changeIndex(index);
                      },
                      child: Card(
                          color: filterationC.selFilterIndex == index
                              ? buttonColor
                              : Colors.white,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation:
                              filterationC.selFilterIndex == index ? 0 : 2,
                          child: Container(
                            constraints: BoxConstraints(minWidth: width * 0.27),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                categoryItems.categoryList[index].name,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: colorBlack,
                                ),
                              ),
                            ),
                          )),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:money_app/controller/transaction_controller.dart';

// class TransactionFilterBar extends StatefulWidget {
//   const TransactionFilterBar({Key? key}) : super(key: key);

//   @override
//   State<TransactionFilterBar> createState() => _TransactionFilterBarState();
// }

// class _TransactionFilterBarState extends State<TransactionFilterBar> {
//   final List<String> items = [
//     'All',
//     'Today',
//     'Yesterday',
//     'Week',
//     'Month',
//   ];
//   int selFilterIndex = 0;
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     return SizedBox(
//       height: 40,
//       width: double.infinity,
//       child: Row(
//         children: [
//           Expanded(
//             child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: items.length,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       setFilter(items[index]);
//                       setState(() {
//                         selFilterIndex = index;
//                       });
//                     },
//                     child: Card(
//                         color: selFilterIndex == index
//                             ? const Color(0xFFF3f3f3)
//                             : Colors.white,
//                         margin: selFilterIndex == index
//                             ? const EdgeInsets.only(top: 10)
//                             : const EdgeInsets.only(bottom: 5),
//                         shape: const RoundedRectangleBorder(),
//                         elevation: selFilterIndex == index ? 0 : 2,
//                         child: Container(
//                           constraints: BoxConstraints(minWidth: width * 0.27),
//                           padding: const EdgeInsets.symmetric(horizontal: 10),
//                           child: Align(
//                             alignment: Alignment.center,
//                             child: Text(
//                               items[index],
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                                 color: selFilterIndex == index
//                                     ? Colors.green
//                                     : Colors.black,
//                               ),
//                             ),
//                           ),
//                         )),
//                   );
//                 }),
//           ),
//         ],
//       ),
//     );
//   }

//   setFilter(var selction) async {
//     final TransactionController transactionCT = Get.find();
//     final DateTime now = DateTime.now();
//     switch (selction) {
//       case 'All':
//         transactionCT.clearFilter();
//         break;
//       case 'Today':
//         DateTime start = DateTime(now.year, now.month, now.day);
//         DateTime end = start.add(const Duration(days: 1));
//         transactionCT.setFilter(start, end);
//         break;
//       case 'Yesterday':
//         DateTime start = DateTime(now.year, now.month, now.day - 1);
//         DateTime end = start.add(const Duration(days: 1));
//         transactionCT.setFilter(start, end);
//         break;
//       case 'Week':
//         DateTime start = DateTime(now.year, now.month, now.day - 6);
//         DateTime end = DateTime(start.year, start.month, start.day + 7);
//         transactionCT.setFilter(start, end);
//         break;
//       case 'Month':
//         transactionCT.transactionPickDate(context);
//         break;

//       default:
//         break;
//     }
//   }
// }
