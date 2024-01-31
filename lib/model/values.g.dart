// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'values.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Values _$ValuesFromJson(Map<String, dynamic> json) => Values(
      json['USD'] == null
          ? null
          : Usd.fromJson(json['USD'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ValuesToJson(Values instance) => <String, dynamic>{
      'USD': instance.usd?.toJson(),
    };
