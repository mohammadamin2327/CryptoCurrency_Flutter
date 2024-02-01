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
                  Container(
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
                            child: setText('Crypto Currency',35),
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
                  Expanded(
                    child: ListView.builder(
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
                              children: <Widget>[
                                setNumberText(
                                    '\$${numberFormat.format(allData.data[index]!.values!.usd!.price!)}',
                                    20,
                                    FontWeight.w400,
                                    Colors.black),
                                Flexible(
                                    child: stringPercentChange(allData
                                        .data[index]!
                                        .values!
                                        .usd!
                                        .percentChange24h!)),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
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
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: <Widget>[
                          const CircleAvatar(
                            radius: 40,
                          ),
                          const SizedBox(width: 15.0,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                color: Colors.grey,
                                ),
                                width: (MediaQuery.of(context).size.width) / 1.67,
                                height: MediaQuery.of(context).size.height / 20,
                              ),
                              const SizedBox(height: 10,),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                color: Colors.grey,
                                ),
                                width: (MediaQuery.of(context).size.width) / 1.67,
                                height: MediaQuery.of(context).size.height / 20,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                color: Colors.grey,
                                ),
                                width: (MediaQuery.of(context).size.width) / 5,
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                color: Colors.grey,
                                ),
                                width: (MediaQuery.of(context).size.width) / 5,
                                height: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
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
