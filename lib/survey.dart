import 'package:flutter/material.dart';

Text stringPercentChange(num percentChange){
  if(percentChange > 0){
    return Text('${const Icon(Icons.arrow_drop_down,color: Colors.red)}${percentChange.toStringAsFixed(2)}%' , style: textStyle(Colors.green,15));
  }else if(percentChange == 0){
    return Text('${const Icon(Icons.abc_outlined)}${percentChange.toStringAsFixed(2)}', style: textStyle(Colors.grey,15));
  }else{
    return Text('${const Icon(Icons.arrow_drop_up,color: Colors.green,)}${percentChange.toStringAsFixed(2)}%' , style: textStyle(Colors.red,15));
  }
}

TextStyle textStyle(Color color,double textFontSize){
  return TextStyle(color: color,fontSize: textFontSize);
}