// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiModel _$ApiModelFromJson(Map<String, dynamic> json) => ApiModel(
      (json['data'] as List<dynamic>)
          .map((e) =>
              e == null ? null : Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiModelToJson(ApiModel instance) => <String, dynamic>{
      'data': instance.data.map((e) => e?.toJson()).toList(),
      'status': instance.status?.toJson(),
      'meta': instance.meta?.toJson(),
    };
