import 'package:coinmarketcap/usd_model.dart';
import 'package:json_annotation/json_annotation.dart';
part'quote_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Quote {
  USD? uSD;

  Quote({this.uSD});

  Quote.fromJson(Map<String, dynamic> json) {
    uSD = json['USD'] != null ? new USD.fromJson(json['USD']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.uSD != null) {
      data['USD'] = this.uSD!.toJson();
    }
    return data;
  }
}