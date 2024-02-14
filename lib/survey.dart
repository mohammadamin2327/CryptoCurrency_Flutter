import 'package:coinmarketcap/utils/constants.dart';
import 'package:flutter/material.dart';

Text stringPercentChange(num percentChange24h){
  if(percentChange24h > 0.00){
    return setNumberText('${percentChange24h.toStringAsFixed(2)}%', 20, FontWeight.w400, Colors.green);
  }else if(percentChange24h == 0){
    return setNumberText(percentChange24h.toStringAsFixed(2), 20, FontWeight.w300, const Color.fromARGB(255, 26, 24, 24));
  }else{
    return setNumberText('${percentChange24h.toStringAsFixed(2)}%', 20, FontWeight.w300, Colors.red);
  }
}

TextStyle textStyle(Color color,double textFontSize){
  return TextStyle(color: color,fontSize: textFontSize);
}