// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiModel _$ApiModelFromJson(Map<String, dynamic> json) => ApiModel(
      (json['data'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiModelToJson(ApiModel instance) => <String, dynamic>{
      'status': instance.status?.toJson(),
      'data': instance.data?.map((e) => e?.toJson()).toList(),
    };
