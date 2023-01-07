import 'package:e_commerce/Screens/category/view/category_view.dart';
import 'package:e_commerce/Screens/home/view/widget/carousel_view.dart';
import 'package:e_commerce/Screens/home/view/widget/category_items.dart';
import 'package:e_commerce/Screens/home/view/widget/grid_view.dart';
import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:e_commerce/util/search_bar/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ScreenHome extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var options;

  ScreenHome({super.key});

  final itemsD = [
    'https://www.shutterstock.com/image-vector/modern-kids-clothes-set-summer-600w-2021848727.jpg',
    'https://www.shutterstock.com/image-photo/young-beautiful-smiling-hipster-woman-600w-2133734771.jpg',
    'https://www.shutterstock.com/image-photo/fashionable-pale-brunette-long-green-600w-1875042193.jpg',
    'https://www.shutterstock.com/image-photo/full-body-profile-photo-cheerful-600w-1898279326.jpg',
    'https://www.shutterstock.com/image-photo/pretty-beautiful-woman-brunette-hair-600w-1695648628.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      extendBodyBehindAppBar: true,
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
              'Shop',
              style: TextStyle(
                letterSpacing: 3,
                fontWeight: FontWeight.bold,
                color: colorBlack,
              ),
            )
          ],
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.09),
          child: const SizedBox(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.15,
              ),
              SearchBar(width: width, height: height),
              kHeight10,
              CarouselWidget(
                height: height,
                itemsD: itemsD,
                width: width,
              ),
              kHeight10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Category',
                    style: TextStyle(
                        color: colorBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(() => ScreenCategory());
                      },
                      child: const Text(
                        'See All >',
                        style: TextStyle(color: colorBlack),
                      ))
                ],
              ),
              HomePageCategoryItems(height: height),
              kHeight10,
              Row(
                children: const [
                  Text(
                    'Featured',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              kHeight10,
              ProductGridView(
                width: width,
                height: height,
              ),
            ],
          ),
        ),
      ),
    );
  }
}








// class CustomSerchDelegate extends SearchDelegate {
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//           onPressed: () {
//             query = '';
//           },
//           icon: const Icon(
//             Icons.clear_outlined,
//             color: Colors.black,
//           ))
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//         onPressed: () {
//           close(context, null);
//         },
//         icon: const Icon(
//           Icons.arrow_back_sharp,
//           color: Colors.black,
//         ));
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return ValueListenableBuilder(
//       valueListenable: TransactionDB.instance.transactionListNotifier,
//       builder: (BuildContext ctx, List<TransactionModel> transactionList,
//           Widget? child) {
//         return SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 10),
//             child: SingleChildScrollView(
//               child: CustomCard(
//                 elevation: 0,
//                 color: const Color.fromARGB(255, 216, 212, 212),
//                 width: width * 0.98,
//                 height: height * 0.96,
//                 borderRadius: 20,
//                 child: ListView.separated(
//                   itemBuilder: (ctx, index) {
//                     final data = transactionList[index];
//                     if (data.catagory.name
//                         .toLowerCase()
//                         .contains(query.toLowerCase())) {
//                       return Column(
//                         children: [
//                           CustomCard(
//                             borderRadius: 100,
//                             child: ListTile(
//                               leading: CircleAvatar(
//                                   backgroundImage: data.type ==
//                                           CategoryType.income
//                                       ? const AssetImage(
//                                           'lib/assets/image/arrow upwarp.png')
//                                       : const AssetImage(
//                                           'lib/assets/image/arrow downward.png')),
//                               title: Text(data.catagory.name),
//                               subtitle: Text(
//                                 data.type.name,
//                                 style: TextStyle(
//                                   color: data.type == CategoryType.income
//                                       ? Colors.green
//                                       : Colors.red,
//                                 ),
//                               ),
//                               trailing: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       '₹ ${data.amount.toString()}',
//                                       style: TextStyle(
//                                         color: data.type == CategoryType.income
//                                             ? Colors.green
//                                             : Colors.red,
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     Text(parseDate(data.date))
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           )
//                         ],
//                       );
//                     } else {
//                       return const Text('');
//                     }
//                   },
//                   separatorBuilder: (ctx, index) {
//                     return const SizedBox();
//                   },
//                   itemCount: transactionList.length,
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return ValueListenableBuilder(
//       valueListenable: TransactionDB.instance.transactionListNotifier,
//       builder: (BuildContext ctx, List<TransactionModel> transactiontList,
//           Widget? child) {
//         return SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 10),
//             child: SingleChildScrollView(
//               child: CustomCard(
//                 elevation: 0,
//                 color: const Color.fromARGB(255, 216, 212, 212),
//                 width: width * 0.98,
//                 height: height * 0.96,
//                 borderRadius: 20,
//                 child: ListView.separated(
//                   itemBuilder: (ctx, index) {
//                     final data = transactiontList[index];
//                     if (data.catagory.name
//                         .toLowerCase()
//                         .contains(query.toLowerCase())) {
//                       return Column(
//                         children: [
//                           CustomCard(
//                             borderRadius: 100,
//                             child: ListTile(
//                               leading: CircleAvatar(
//                                   backgroundImage: data.type ==
//                                           CategoryType.income
//                                       ? const AssetImage(
//                                           'lib/assets/image/arrow upwarp.png')
//                                       : const AssetImage(
//                                           'lib/assets/image/arrow downward.png')),
//                               title: Text(data.catagory.name),
//                               subtitle: Text(
//                                 data.type.name,
//                                 style: TextStyle(
//                                   color: data.type == CategoryType.income
//                                       ? Colors.green
//                                       : Colors.red,
//                                 ),
//                               ),
//                               trailing: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     // Text(
//                                     //   '₹ ${data.amount.toString()}',
//                                     //   style: TextStyle(
//                                     //     color: data.type == CategoryType.income
//                                     //         ? Colors.green
//                                     //         : Colors.red,
//                                     //   ),
//                                     // ),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     // Text(parseDate(data.date))
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           )
//                         ],
//                       );
//                     } else {
//                       return const Text('');
//                     }
//                   },
//                   separatorBuilder: (ctx, index) {
//                     return const SizedBox();
//                   },
//                   itemCount: transactiontList.length,
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
