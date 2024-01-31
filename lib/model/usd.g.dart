// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usd.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Usd _$UsdFromJson(Map<String, dynamic> json) => Usd(
      json['price'] as num?,
      json['marketCap'] as num?,
      json['volume24h'] as num?,
      json['high24h'] as num?,
      json['low24h'] as num?,
      json['percentChange24h'] as num?,
      json['percentChange7d'] as num?,
      json['percentChange30d'] as num?,
      json['percentChange3m'] as num?,
      json['percentChange6m'] as num?,
    );

Map<String, dynamic> _$UsdToJson(Usd instance) => <String, dynamic>{
      'price': instance.price,
      'marketCap': instance.marketCap,
      'volume24h': instance.volume24h,
      'high24h': instance.high24h,
      'low24h': instance.low24h,
      'percentChange24h': instance.percentChange24h,
      'percentChange7d': instance.percentChange7d,
      'percentChange30d': instance.percentChange30d,
      'percentChange3m': instance.percentChange3m,
      'percentChange6m': instance.percentChange6m,
    };
