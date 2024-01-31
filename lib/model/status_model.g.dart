// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      json['success'] as bool?,
      json['time'] as String?,
      json['code'] as num?,
      json['message'] as String?,
      json['responseTime'] as num?,
      json['creditsCost'] as num?,
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'success': instance.success,
      'time': instance.time,
      'code': instance.code,
      'message': instance.message,
      'responseTime': instance.responseTime,
      'creditsCost': instance.creditsCost,
    };
