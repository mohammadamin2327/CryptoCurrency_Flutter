import 'package:json_annotation/json_annotation.dart';
part'status_model.g.dart';

@JsonSerializable()
class Status {
  
  String? timestamp;

  num? errorCode;

  dynamic errorMessage;

  num? elapsed;

  num? creditCount;

  dynamic notice;

  num? totalCount;

  Status(this.timestamp,this.errorCode,this.errorMessage,this.elapsed,this.creditCount,this.notice,
  this.totalCount);

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}
