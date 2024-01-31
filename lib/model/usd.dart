import 'package:json_annotation/json_annotation.dart';
part 'usd.g.dart';

@JsonSerializable()
class Usd{
num? price;

num? marketCap;

num? volume24h;

num? high24h;

num? low24h;

num? percentChange24h;	

num? percentChange7d;	

num? percentChange30d;

num? percentChange3m;

num? percentChange6m;

  Usd(
    this.price,
    this.marketCap,
    this.volume24h,
    this.high24h,
    this.low24h,
    this.percentChange24h,
    this.percentChange7d,
    this.percentChange30d,
    this.percentChange3m,
    this.percentChange6m,
  );

  factory Usd.fromJson(Map<String, dynamic> json) =>
      _$UsdFromJson(json);

  Map<String, dynamic> toJson() => _$UsdToJson(this);
}
