import 'package:e_commerce/core/size.dart';
import 'package:e_commerce/core/text_style.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 234, 234),
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
              TextButton.icon(
                style: ButtonStyle(
                  alignment: Alignment.centerLeft,
                  backgroundColor: MaterialStateProperty.all(colorWhite),
                  fixedSize:
                      MaterialStateProperty.all(Size(width, height * 0.05)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: const BorderSide(color: colorWhite),
                    ),
                  ),
                ),
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: colorBlack,
                ),
                label: const Text(
                  'What are you looking for?',
                  style: TextStyle(color: colorBlack),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Catalogue',
                    style: TextStyle(
                        color: colorBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'See All >',
                        style: TextStyle(color: colorBlack),
                      ))
                ],
              ),
              LimitedBox(
                maxHeight: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    10,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Container(
                            width: height * 0.13,
                            height: height * 0.13,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/dress/dress5.jpg'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const Center(
                            child: Text(
                              "Women's\nFasion",
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                color: colorWhite,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
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
              const Text('hello'),
              Container(
                color: colorBlack,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 0,
                      childAspectRatio: 1 / 1.5),
                  itemBuilder: (BuildContext ctx, int index) {
                    return Container(
                      width: width * 0.1,
                      // height: 50,
                      color: Colors.blue,
                      child: Column(
                        children: [
                          Container(
                            width: height * 0.3,
                            height: height * 0.25,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/dress/dress3.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const Text('Saodimallsu womens')
                        ],
                      ),
                    );
                  },
                  itemCount: 10,
                ),
              )
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
