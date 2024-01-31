import 'package:json_annotation/json_annotation.dart';
part 'status_model.g.dart';

@JsonSerializable()
class Status {
bool? success;

String? time;

num? code;

String? message;

num? responseTime;

num? creditsCost;

Status(
  this.success,
  this.time,
  this.code,
  this.message,
  this.responseTime,
  this.creditsCost,
);

factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}
