import 'package:flutter/material.dart';

class TextButtonWidget extends StatefulWidget {
  final String text;
  final void Function()? onPressed;
  final TextStyle? textStyle;
  const TextButtonWidget(
      {super.key, required this.text, required this.onPressed, this.textStyle});

  @override
  State<TextButtonWidget> createState() => _TextButtonWidgetState();
}

class _TextButtonWidgetState extends State<TextButtonWidget> {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = widget.textStyle!;
    String text = widget.text;
    void Function()? onPressed = widget.onPressed;
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
