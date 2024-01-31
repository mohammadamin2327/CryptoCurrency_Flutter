import 'package:flutter/material.dart';

Text stringPercentChange(num percentChange24h){
  if(percentChange24h > 0){
    return Text('${percentChange24h.toStringAsFixed(2)}%' , style: textStyle(Colors.green,15));
  }else if(percentChange24h == 0){
    return Text(percentChange24h.toStringAsFixed(2), style: textStyle(Colors.grey,15));
  }else{
    return Text('${percentChange24h.toStringAsFixed(2)}%' , style: textStyle(Colors.red,15));
  }
}

TextStyle textStyle(Color color,double textFontSize){
  return TextStyle(color: color,fontSize: textFontSize);
}