import 'package:json_annotation/json_annotation.dart';
import 'quote_model.dart';
part'data_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Data {

  num? id;

  String? name;

  String? symbol;

  String? slug;

  num? numMarketPairs;

  String? dateAdded;

  List<String>? tags;

  num? maxSupply;

  num? circulatingSupply;

  num? totalSupply;

  bool? infiniteSupply;

  num? cmcRank;

  dynamic selfReportedCirculatingSupply;

  dynamic selfReportedMarketCap;

  dynamic tvlRatio;

  String? lastUpdated;

  Quote? quote;

  Data(this.id,this.name,this.symbol,this.slug,this.numMarketPairs,this.dateAdded,this.tags,
  this.maxSupply,this.circulatingSupply,this.totalSupply,this.infiniteSupply,this.cmcRank,
  this.selfReportedCirculatingSupply,this.selfReportedMarketCap,this.tvlRatio,this.lastUpdated,this.quote);

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
