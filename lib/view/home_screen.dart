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

  @override
  void initState() {
    super.initState();
    apiProvider = ApiCall();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var numberFormat = NumberFormat('0,000.00', 'en_US');
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 241, 241, 241),
        bottomNavigationBar: const BottomAppBarItem(),
        body: FutureBuilder<ApiModel>(
          future: apiProvider.apiCall(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              ApiModel? allData = snapshot.data;
              return Column(
                children: <Widget>[
                  setText('Crypto Currency'),
                  TextField(
                    controller: textEditingController,
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          tileColor: Colors.white,
                          title: Text('${allData!.data[index]!.symbol}'),
                          subtitle: Text('${allData.data[index]!.name}'),
                          // leading: CachedNetworkImage(
                          //   imageUrl: '${allData.data[index]!.images!.size60}',
                          //   placeholder: (context, url) =>
                          //       const CircularStepProgressIndicator(
                          //     totalSteps: 100,
                          //     selectedColor: Colors.blueAccent,
                          //     unselectedColor: Colors.transparent,
                          //     currentStep: 0,
                          //     width: 100,
                          //     height: 100,
                          //     stepSize: 10,
                          //     circularDirection: CircularDirection.clockwise,
                          //   ),
                          //   errorWidget: (context, url, error) =>
                          //       const Icon(Icons.error_outline_sharp),
                          // ),
                          trailing: Column(
                            children: <Widget>[
                              Text(
                                  '\$${numberFormat.format(allData.data[index]!.values!.usd!.price!)}'),
                              stringPercentChange(allData
                                  .data[index]!.values!.usd!.percentChange24h!),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            } else {
              return Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.white,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: <Widget>[
                        const CircleAvatar(),
                        Column(
                          children: <Widget>[
                            Container(
                              color: Colors.grey,
                              width: 10,
                              height: 10,
                            ),
                            Container(
                              color: Colors.grey,
                              width: 10,
                              height: 10,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: <Widget>[
                            Container(
                              color: Colors.grey,
                              width: 10,
                              height: 10,
                            ),
                            Container(
                              color: Colors.grey,
                              width: 10,
                              height: 10,
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

