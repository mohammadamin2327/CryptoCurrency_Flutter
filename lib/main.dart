import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:coinmarketcap/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'view/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://dlbdmrcjesvbntyvjvxh.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRsYmRtcmNqZXN2Ym50eXZqdnhoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDc1NDk2NjcsImV4cCI6MjAyMzEyNTY2N30.hoa0LAx1xMuM2o1GzArV_lev28t7ulByxIzlIsZrzPk',
  );
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
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
   if (connectivityResult == ConnectivityResult.mobile) {
     runApp(const MainScreen());
   } else if (connectivityResult == ConnectivityResult.wifi) {
     runApp(const MainScreen());
   } else {
     runApp(const ErrorNetworkScreen());
   }
  runApp(const MainScreen());
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'coninMarketCap',
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const RegisterPage(),
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
