import 'package:coinmarketcap/model/usd_model.dart';
import 'package:json_annotation/json_annotation.dart';
part'quote_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Quote {

  USD? uSD;

  Quote(this.uSD);

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);

  Map<String, dynamic> toJson() => _$QuoteToJson(this);
}