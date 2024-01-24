import 'package:coinmarketcap/bottom_appbar.dart';
import 'package:coinmarketcap/model/api_model.dart';
import 'package:coinmarketcap/service/api_call.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollController _scrollController;
  late final ApiCall apiProvider;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    apiProvider = ApiCall();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orange,
        bottomNavigationBar: const BottomAppBarItem(),
        appBar: AppBar(backgroundColor: Colors.red),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder(
              future: apiProvider.apiCall(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  ApiModel? allData = snapshot.data;
                  return ListView.builder(
                    padding: const EdgeInsets.all(10.0),
                    scrollDirection: Axis.vertical,
                    physics: const ClampingScrollPhysics(),
                    controller: _scrollController,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text('${allData!.data![index]!.symbol}'),
                        subtitle: Text('${allData.data![index]!.name}'),
                        leading: CachedNetworkImage(
                          imageUrl:
                              'https://s2.coinmarketcap.com/static/img/coins/64x64/${allData.data![index]!.id}.png',
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
                        trailing: Column(
                          children: <Widget>[
                            Text(
                                '\$${allData.data![index]!.quote!.uSD!.price!.toStringAsFixed(2)}'),
                            const Text(''),
                          ],
                        ),
                        shape: null,
                      );
                    },
                  );
                } else {
                  return Shimmer.fromColors(
                    baseColor: Colors.blue,
                    highlightColor: Colors.red,
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (BuildContext buildContext , int index){
                        return const ListTile(
                          leading: CircleAvatar(),
                          title: SizedBox(
                            width: 10,
                            height: 10,
                          ),
                          subtitle: SizedBox(
                            width: 5,
                            height: 5,
                          ),
                          trailing: Column(
                            children: <Widget>[
                              SizedBox(),
                              SizedBox()
                            ],
                          ),
                        );
                      },
                      ),
                  );
                  // return const CircularStepProgressIndicator(
                  //   totalSteps: 100,
                  //   selectedColor: Colors.blueAccent,
                  //   unselectedColor: Colors.transparent,
                  //   currentStep: 0,
                  //   width: 100,
                  //   height: 100,
                  //   stepSize: 10,
                  //   circularDirection: CircularDirection.clockwise,
                  // );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
