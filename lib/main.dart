import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'view/home_screen.dart';

void main() async {
  ConnectivityResult connectivityResult =
      await (Connectivity().checkConnectivity());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  if (connectivityResult == ConnectivityResult.mobile) {
    runApp(const MainScreen());
  } else if (connectivityResult == ConnectivityResult.wifi) {
    runApp(const MainScreen());
  } else {
    runApp(const ErrorNetworkScreen());
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'coninMarketCap',
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class ErrorNetworkScreen extends StatelessWidget {
  const ErrorNetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'coinMarketCap',
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text('please check your connection then try again.'),
            ElevatedButton(
              onPressed: () {},
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.amber),
              ),
              child: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}
