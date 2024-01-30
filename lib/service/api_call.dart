// import 'package:coinmarketcap/model/api_model.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

// class ApiCall {
//   Future<ApiModel> apiCall() async {
//     late dynamic response;
//     try {
//       Dio dio = Dio(
//         BaseOptions(
//           method: 'GET',
//           baseUrl:
//                 // 'https://sandbox-api.coinmarketcap.com/v1/cryptocurrency/listings/latest',
//               'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&limit=10&convert=USD',
//           headers: {
//             'Accepts': 'application/json',
//             'X-CMC_PRO_API_KEY': '0b7da7dd-de65-4b8c-86b8-7202641bad36'
//           },
//           responseType: ResponseType.json,
//           queryParameters: {"start": 1, "limit": 10, "convert": "USD"},
//         ),
//       );
//       debugPrint('1');
//       response = await dio.get(dio.options.baseUrl);
//       debugPrint('2');
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//     if (response.statusCode == 200) {
//       var resultApiCall = response.data;
//       ApiModel result = ApiModel.fromJson(resultApiCall);
//       return result;
//     } else {
//       throw Exception('faild to load data, please try later.');
//     }
//   }
// }
// /* note: this file try to get data from server and if everything was good the return data(json) send to
//  fromJson method for parse it and use them in app. */
// import 'dart:convert';
// import 'dart:io';
// import 'package:coinmarketcap/model/api_model.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class ApiCall {
//   late final dynamic response;
//   Future<ApiModel> apiCall() async {
//     try {
//       response = await http.get(
//         Uri.parse(
//           'http://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&limit=10&convert=USD',
//         ),
//         headers: {
//           "X-CMC_PRO_API_KEY": "0b7da7dd-de65-4b8c-86b8-7202641bad36",
//           'Accept': 'application/json',
//           'Content-Type': 'application/json',
//           HttpHeaders.authorizationHeader : '0b7da7dd-de65-4b8c-86b8-7202641bad36',
//         },
//       );
//       debugPrint(response.statusCode.toString());
//       print(response);
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//     if (response.statusCode == 200) {
//       var resultApiCall = response.body;
//       var result = jsonDecode(resultApiCall) as Map<String, dynamic>;
//       debugPrint(resultApiCall);
//       return ApiModel.fromJson(result);
//     } else {
//       throw Exception('fails to load data,please try later');
//     }
//   }
// }




import 'package:coinmarketcap/model/api_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiCall {
  Future<ApiModel> apiCall() async {
    late var response;
    try {
      Dio dio = Dio(
        BaseOptions(
          method: 'GET',
          baseUrl:
              'https://api.cryptorank.io/v1/currencies?limit=10&convert=USD&api_key=27c55042085560d9003a523d19b13a53e8b769e8c1687dfb35e20f8be689',
          responseType: ResponseType.json,
        ),
      );
      response = await dio.get(dio.options.baseUrl);
      debugPrint(response.statusCode.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
    if (response.statusCode == 200) {
      debugPrint(response);
      var resultApiCall = response.data;
      ApiModel result = ApiModel.fromJson(resultApiCall);
      return result;
    } else {
      throw Exception('faild to load data, please try later.');
    }
  }
}