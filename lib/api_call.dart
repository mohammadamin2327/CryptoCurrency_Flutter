import 'package:coinmarketcap/api_model.dart';
import 'package:dio/dio.dart';

class ApiCall {
  final dio = Dio();
  final String baseUrl =
      'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest';
  Future<ApiModel> apiCall() async {
    var response = await dio.get(baseUrl,
        options: Options(
          headers: {
          'X-CMC_PRO_API_KEY': '0b7da7dd-de65-4b8c-86b8-7202641bad36'
        }),
        queryParameters: {"start": 1, "limit": 10, "convert": "USD"});
    if (response.statusCode == 200) {
      var resultApiCall = response.data;
      return ApiModel.fromJson(resultApiCall);
    } else {
      throw Exception('faild to load data, please try later.');
    }
  }
}
/* note: this file try to get data from server and if everything was good the return data(json) send to 
 fromJson method for parse it and use them in app. */