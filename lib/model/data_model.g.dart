// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['id'] as num?,
      json['rank'] as num?,
      json['slug'] as String?,
      json['name'] as String?,
      json['symbol'] as String?,
      json['category'] as String?,
      json['type'] as String?,
      json['volume24hBase'] as num?,
      json['circulatingSupply'] as num?,
      json['totalSupply'] as num?,
      json['maxSupply'] as num?,
      json['values'] == null
          ? null
          : Values.fromJson(json['values'] as Map<String, dynamic>),
      json['lastUpdated'] as String?,
      (json['tokens'] as List<dynamic>?)
          ?.map((e) => Tokens.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['links'] as List<dynamic>?)
          ?.map((e) => Links.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['images'] == null
          ? null
          : Images.fromJson(json['images'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'rank': instance.rank,
      'slug': instance.slug,
      'name': instance.name,
      'symbol': instance.symbol,
      'category': instance.category,
      'type': instance.type,
      'volume24hBase': instance.volume24hBase,
      'circulatingSupply': instance.circulatingSupply,
      'totalSupply': instance.totalSupply,
      'maxSupply': instance.maxSupply,
      'values': instance.values?.toJson(),
      'lastUpdated': instance.lastUpdated,
      'tokens': instance.tokens?.map((e) => e.toJson()).toList(),
      'links': instance.links?.map((e) => e.toJson()).toList(),
      'images': instance.images?.toJson(),
    };
