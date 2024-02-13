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
  final NumberFormat numberFormat = NumberFormat('0,000.00', 'en_US');
  late final TextEditingController textEditingController;
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
  late final ApiCall apiProvider;
  late Widget? bodyInput;

  @override
  void initState() {
    apiProvider = ApiCall();
    textEditingController = TextEditingController();
    super.initState();
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
        backgroundColor: const Color.fromARGB(
          255,
          241,
          241,
          241,
        ),
        bottomNavigationBar: const BottomAppBarItem(),
        body: FutureBuilder<ApiModel>(
          future: apiProvider.apiCall(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              ApiModel? allData = snapshot.data;
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: Padding(
                      padding: const EdgeInsets.all(
                        8.0,
                      ),
                      child: TextField(
                        onChanged: (String text) {
                          String lowerCaseText = text.toLowerCase();
                          for (var i = 0; i < 10; i++) {
                            if (allData!.data[i]!.slug!
                                .contains(lowerCaseText)) {
                              bodyInput = SliverList.builder(itemBuilder:
                                  (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(
                                    5.0,
                                  ),
                                  child: ListTile(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        12,
                                      ),
                                    ),
                                    tileColor: Colors.white,
                                    title: setNumberText(
                                      '${allData.data[i]!.symbol}',
                                      23,
                                      FontWeight.w400,
                                      Colors.black,
                                    ),
                                    subtitle: setNumberText(
                                      '${allData.data[i]!.name}',
                                      20,
                                      FontWeight.w300,
                                      Colors.grey,
                                    ),
                                    trailing: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Flexible(
                                          child: setNumberText(
                                            '\$${numberFormat.format(allData.data[i]!.values!.usd!.price!)}',
                                            20,
                                            FontWeight.w400,
                                            Colors.black,
                                          ),
                                        ),
                                        Flexible(
                                          child: stringPercentChange(
                                            allData.data[i]!.values!.usd!
                                                .percentChange24h!,
                                          ),
                                        ),
                                      ],
                                    ),
                                    leading: CachedNetworkImage(
                                      imageUrl:
                                          'https://s2.coinmarketcap.com/static/img/coins/64x64/${integerDataSource[i]}.png',
                                      placeholder: (context, url) =>
                                          const CircularProgressIndicator(
                                        strokeWidth: 3.0,
                                        backgroundColor: Colors.transparent,
                                        color: Colors.blue,
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(
                                        Icons.error_outline_sharp,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                );
                              });
                              setState(() {});
                            } else {
                              continue;
                            }
                          }
                        },
                        controller: textEditingController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(
                            180,
                            216,
                            216,
                            216,
                          ),
                          prefixIcon: const Icon(
                            Icons.search_outlined,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                          hintText: 'Search',
                        ),
                      ),
                    ),
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
                              padding: const EdgeInsets.all(
                                8.0,
                              ),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: setText(
                                  'Crypto Currency',
                                  35,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(
                                8.0,
                              ),
                              child: TextField(
                                controller: textEditingController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color.fromARGB(
                                    180,
                                    216,
                                    216,
                                    216,
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.search_outlined,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      12,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      12,
                                    ),
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
                  bodyInput ??
                      SliverList.builder(
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
                              leading: CachedNetworkImage(
                                imageUrl:
                                    'https://s2.coinmarketcap.com/static/img/coins/64x64/${integerDataSource[index]}.png',
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(
                                  strokeWidth: 3.0,
                                  backgroundColor: Colors.transparent,
                                  color: Colors.blue,
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.error_outline_sharp,
                                  size: 40,
                                ),
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
                    return Padding(
                      padding: const EdgeInsets.all(
                        15.0,
                      ),
                      child: Row(
                        children: <Widget>[
                          const CircleAvatar(
                            radius: 40,
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              setContainer(
                                2,
                                0.2,
                                context,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              setContainer(
                                2,
                                0.2,
                                context,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Column(
                            children: <Widget>[
                              setContainer(
                                0.5,
                                0.2,
                                context,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              setContainer(
                                0.5,
                                0.2,
                                context,
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
