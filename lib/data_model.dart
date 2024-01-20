import 'package:json_annotation/json_annotation.dart';
import 'quote_model.dart';
import 'platform_model.dart';
part'data_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DataModel {
  int? _id;
  String? _name;
  String? _symbol;
  String? _slug;
  int? _numMarketPairs;
  String? _dateAdded;
  List<String>? _tags;
  int? _maxSupply;
  double? _circulatingSupply;
  double? _totalSupply;
  bool? _infiniteSupply;
 // Platform? _platform;
  int? _cmcRank;
  Null? _selfReportedCirculatingSupply;
  Null? _selfReportedMarketCap;
  Null? _tvlRatio;
  String? _lastUpdated;
  Quote? _quote;

  DataModel(this._id,this._name,this._symbol,this._slug,this._numMarketPairs,this._dateAddedthis,this._tags,
  this._maxSupply,this._circulatingSupply,this._totalSupply,this._infiniteSupply,this._cmcRank,
  this._selfReportedCirculatingSupply,this._selfReportedMarketCap,this._tvlRatio,this._lastUpdated,this._quote)

  factory Data.fromJson(Map<String, dynamic> json) => _DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
