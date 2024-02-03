import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:coinmarketcap/service/api_call.dart';
import 'package:coinmarketcap/model/api_model.dart';
import 'package:coinmarketcap/utils/constants.dart';
import 'package:coinmarketcap/bottom_appbar.dart';
import 'package:coinmarketcap/survey.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ApiCall apiProvider;
  late final TextEditingController textEditingController;
    final NumberFormat numberFormat = NumberFormat('0,000.00', 'en_US');
  final List<int> integerDataSource = [
    1,
    1027,
    825,
    1839,
    5426,
    52,
    3408,
    8085,
    2010,
    5805,
  ];

  @override
  void initState() {
    super.initState();
    apiProvider = ApiCall();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final someOtherSliver = SliverToBoxAdapter(
      return SliverToBoxAdapter(
          child: FutureBuilder(
            future: apiProvider.apiCall(),
              builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            var allData =snapshot.data;
            return SliverList(
              delegate:
                  SliverChildBuilderDelegate(childCount: 10, (context, index) {
                return Column(
                  children: <Widget>[
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            leading: CachedNetworkImage(
                              imageUrl:
                                  'https://s2.coinmarketcap.com/static/img/coins/64x64/${integerDataSource[index]}.png',
                              placeholder: (context, url) =>
                                  const CircularStepProgressIndicator(
                                totalSteps: 100,
                                selectedColor: Colors.blueAccent,
                                unselectedColor: Colors.transparent,
                                currentStep: 0,
                                width: 100,
                                height: 100,
                                stepSize: 10,
                                circularDirection: CircularDirection.clockwise,
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error_outline_sharp),
                            ),
                            tileColor: Colors.white,
                            title: setNumberText(
                              '${allData!.data[index]!.symbol}',
                              23,
                              FontWeight.w400,
                              Colors.black,
                            ),
                            subtitle: setNumberText(
                              '${allData.data[index]!.name}',
                              20,
                              FontWeight.w300,
                              Colors.grey,
                            ),
                            trailing: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Flexible(
                                  child: setNumberText(
                                    '\$${numberFormat.format(allData.data[index]!.values!.usd!.price!)}',
                                    20,
                                    FontWeight.w400,
                                    Colors.black,
                                  ),
                                ),
                                Flexible(
                                  child: stringPercentChange(
                                    allData.data[index]!.values!.usd!
                                        .percentChange24h!,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                    //),
                  ],
                );
              }),
            );
          } else {
            return Container();
          }
              },
          return CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.white,
                  floating: false,
                  pinned: true,
                  expandedHeight: 200.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: (MediaQuery.of(context).size.height) / 4.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: setText('Crypto Currency', 35),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: textEditingController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color.fromARGB(180, 216, 216, 216),
                                prefixIcon: const Icon(Icons.search_outlined),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: 'Search',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
          
                // return SliverList.builder(
                //   itemBuilder: (BuildContext context, int index) {
                //     return Shimmer.fromColors(
                //     baseColor: Colors.grey,
                //     highlightColor: Colors.white,
                //     child: SliverList.builder(
                //       itemCount: 10,
                //       itemBuilder: (BuildContext context, int index) {
                //         return Padding(
                //           padding: const EdgeInsets.all(15.0),
                //           child: Row(
                //             children: <Widget>[
                //               const CircleAvatar(
                //                 radius: 40,
                //               ),
                //               const SizedBox(
                //                 width: 15.0,
                //               ),
                //               Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: <Widget>[
                //                   Container(
                //                     decoration: BoxDecoration(
                //                       borderRadius:
                //                           BorderRadius.circular(12.0),
                //                       color: Colors.grey,
                //                     ),
                //                     width:
                //                         (MediaQuery.of(context).size.width) /
                //                             1.67,
                //                     height:
                //                         MediaQuery.of(context).size.height /
                //                             20,
                //                   ),
                //                   const SizedBox(
                //                     height: 10,
                //                   ),
                //                   Container(
                //                     decoration: BoxDecoration(
                //                       borderRadius:
                //                           BorderRadius.circular(12.0),
                //                       color: Colors.grey,
                //                     ),
                //                     width:
                //                         (MediaQuery.of(context).size.width) /
                //                             1.67,
                //                     height:
                //                         MediaQuery.of(context).size.height /
                //                             20,
                //                   ),
                //                 ],
                //               ),
                //               const Spacer(),
                //               Column(
                //                 children: <Widget>[
                //                   Container(
                //                     decoration: BoxDecoration(
                //                       borderRadius:
                //                           BorderRadius.circular(12.0),
                //                       color: Colors.grey,
                //                     ),
                //                     width:
                //                         (MediaQuery.of(context).size.width) /
                //                             5,
                //                     height:
                //                         MediaQuery.of(context).size.height /
                //                             20,
                //                   ),
                //                   const SizedBox(
                //                     height: 10,
                //                   ),
                //                   Container(
                //                     decoration: BoxDecoration(
                //                       borderRadius:
                //                           BorderRadius.circular(12.0),
                //                       color: Colors.grey,
                //                     ),
                //                     width:
                //                         (MediaQuery.of(context).size.width) /
                //                             5,
                //                     height:
                //                         MediaQuery.of(context).size.height /
                //                             20,
                //                   ),
                //                 ],
                //               ),
                //             ],
                //           ),
                //         );
                //       },
                //     ),
                //   );
                //    },
                // );
              ],
            ),
          ),
        ),
    );
    
  }
}
