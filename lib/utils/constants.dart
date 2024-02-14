import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

Text setText(String? inputText, double fontSize) {
  return Text(
    inputText!,
    style: GoogleFonts.roboto(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
    ),
  );
}

Text setNumberText(String? inputNumberText, double fontSize,
    FontWeight fontWeight, Color color) {
  return Text(
    inputNumberText!,
    style: GoogleFonts.lato(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
    ),
  );
}

Container setContainer(
    double? sizeWidth, double? sizeHeight, BuildContext context) {
  Size screenSize = ((MediaQuery.of(context).size) / 3);
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.0),
      color: Colors.grey,
    ),
    width: (screenSize.width) * sizeWidth!,
    height: (screenSize.height) * sizeHeight!,
  );
}

Padding setRegisterText(
    {String? text, double? fontSize, FontWeight? fontWeight, Color? color}) {
  return Padding(
    padding: const EdgeInsets.only(left: 15),
    child: Align(
      alignment: Alignment.topLeft,
      child: Text(
        text!,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    ),
  );
}
