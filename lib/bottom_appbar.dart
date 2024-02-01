import 'package:flutter/material.dart';

class BottomAppBarItem extends StatefulWidget {
  const BottomAppBarItem({super.key});

  @override
  State<BottomAppBarItem> createState() => _BottomAppBarItemState();
}

class _BottomAppBarItemState extends State<BottomAppBarItem> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.amber,
      elevation: 4.0,
      height: (MediaQuery.of(context).size.height) / 12,
      shape: const CircularNotchedRectangle()
    );
  }
}
