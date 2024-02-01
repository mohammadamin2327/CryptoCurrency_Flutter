import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

Text setText(String? inputText,double fontSize) {
  return Text(
    inputText!,
    style: GoogleFonts.roboto(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
    ),
  );
}

Text setNumberText(String? inputNumberText,double fontSize,FontWeight fontWeight,Color color) {
  return Text(
    inputNumberText!,
    style: GoogleFonts.lato(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
    ),
  );
}
