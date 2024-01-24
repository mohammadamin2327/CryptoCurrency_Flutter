// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['id'] as num?,
      json['name'] as String?,
      json['symbol'] as String?,
      json['slug'] as String?,
      json['numMarketPairs'] as num?,
      json['dateAdded'] as String?,
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['maxSupply'] as num?,
      json['circulatingSupply'] as num?,
      json['totalSupply'] as num?,
      json['infiniteSupply'] as bool?,
      json['cmcRank'] as num?,
      json['selfReportedCirculatingSupply'],
      json['selfReportedMarketCap'],
      json['tvlRatio'],
      json['lastUpdated'] as String?,
      json['quote'] == null
          ? null
          : Quote.fromJson(json['quote'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'slug': instance.slug,
      'numMarketPairs': instance.numMarketPairs,
      'dateAdded': instance.dateAdded,
      'tags': instance.tags,
      'maxSupply': instance.maxSupply,
      'circulatingSupply': instance.circulatingSupply,
      'totalSupply': instance.totalSupply,
      'infiniteSupply': instance.infiniteSupply,
      'cmcRank': instance.cmcRank,
      'selfReportedCirculatingSupply': instance.selfReportedCirculatingSupply,
      'selfReportedMarketCap': instance.selfReportedMarketCap,
      'tvlRatio': instance.tvlRatio,
      'lastUpdated': instance.lastUpdated,
      'quote': instance.quote?.toJson(),
    };
