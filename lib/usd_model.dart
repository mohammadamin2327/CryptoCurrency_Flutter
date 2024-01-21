import 'package:json_annotation/json_annotation.dart';
part'usd_model.g.dart';

@JsonSerializable()
class USD {

  num? price;

  num? volume24h;

  num? volumeChange24h;

  num? percentChange1h;

  num? percentChange24h;

  num? percentChange7d;

  num? percentChange30d;

  num? percentChange60d;

  num? percentChange90d;

  num? marketCap;

  num? marketCapDominance;

  num? fullyDilutedMarketCap;

  dynamic tvl;

  String? lastUpdated;

  USD(this.price,this.volume24h,this.volumeChange24h,this.percentChange1h,this.percentChange24h,
      this.percentChange7d,this.percentChange30d,this.percentChange60d,this.percentChange90d,
      this.marketCap,this.marketCapDominance,this.fullyDilutedMarketCap,this.tvl,this.lastUpdated);

  factory USD.fromJson(Map<String, dynamic> json) => _$USDFromJson(json);

  Map<String, dynamic> toJson() => _$USDToJson(this);
}