import 'package:coinmarketcap/model/api_model.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ApiCall {
  final dio = Dio();
  final String baseUrl = 'https://api.cryptorank.io/v1/currencies?limit=10&convert=USD&api_key=27c55042085560d9003a523d19b13a53e8b769e8c1687dfb35e20f8be689';
  late final dynamic returnResult;
  Future<ApiModel> apiCall() async {
    try {
      var response = await dio.get(baseUrl);
      if(response.statusCode == 200){
        var resultApiCall = response.data as Map<String,dynamic>;
        returnResult = ApiModel.fromJson(resultApiCall);
      }else{
        throw Exception('faild to load data. please try later');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return returnResult;
  }
}