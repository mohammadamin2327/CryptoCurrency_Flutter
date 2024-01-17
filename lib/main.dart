import 'package:flutter/material.dart';
import '../home_screen.dart';
import '../api_call.dart';

void main(){
  runApp(const MainScreen());
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}