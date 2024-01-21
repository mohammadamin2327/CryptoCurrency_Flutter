import 'package:coinmarketcap/bottom_appbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const BottomAppBarItem(),
        appBar: AppBar(),
        body: const Column(
          children: [
          ],
        ),
      ),
    );
  }
}