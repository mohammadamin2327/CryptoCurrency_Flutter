import 'package:flutter_test/flutter_test.dart';
import 'package:coinmarketcap/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  test(
    'Test constants function',
    () {
      Widget result = setText('inputText', 20);
      expect(
        result,
        Text(
          'inputText',
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      );
    },
  );
}
