// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usd_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

USD _$USDFromJson(Map<String, dynamic> json) => USD(
      json['price'] as num?,
      json['volume24h'] as num?,
      json['volumeChange24h'] as num?,
      json['percentChange1h'] as num?,
      json['percentChange24h'] as num?,
      json['percentChange7d'] as num?,
      json['percentChange30d'] as num?,
      json['percentChange60d'] as num?,
      json['percentChange90d'] as num?,
      json['marketCap'] as num?,
      json['marketCapDominance'] as num?,
      json['fullyDilutedMarketCap'] as num?,
      json['tvl'],
      json['lastUpdated'] as String?,
    );

Map<String, dynamic> _$USDToJson(USD instance) => <String, dynamic>{
      'price': instance.price,
      'volume24h': instance.volume24h,
      'volumeChange24h': instance.volumeChange24h,
      'percentChange1h': instance.percentChange1h,
      'percentChange24h': instance.percentChange24h,
      'percentChange7d': instance.percentChange7d,
      'percentChange30d': instance.percentChange30d,
      'percentChange60d': instance.percentChange60d,
      'percentChange90d': instance.percentChange90d,
      'marketCap': instance.marketCap,
      'marketCapDominance': instance.marketCapDominance,
      'fullyDilutedMarketCap': instance.fullyDilutedMarketCap,
      'tvl': instance.tvl,
      'lastUpdated': instance.lastUpdated,
    };
