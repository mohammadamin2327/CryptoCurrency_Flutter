import 'package:coinmarketcap/api_model.dart';
import 'package:dio/dio.dart';

class ApiCall{
  final dio = Dio();
  final String baseUrl = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest';
  void apiCall() async {
    var response = await dio.get(baseUrl,queryParameters: {
      "start": 1,
      "limit": 10,
      "convert": "USD"
    });
    var resultApiCall = response.data;
    ApiModel.fromJson(resultApiCall);
    print(resultApiCall);
  }
}