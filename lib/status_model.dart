import 'package:json_annotation/json_annotation.dart';
part'status.g.dart';

@JsonSerializable()
class StatusModel {
  String? _timestamp;
  int? _errorCode;
  Null? _errorMessage;
  int? _elapsed;
  int? _creditCount;
  Null? _notice;
  int? _totalCount;

  StatusModel(this._timestamp,this._errorCode,this._errorMessage,this._elapsed,this._creditCount,this._notice,
  this._totalCount);

  factory Status.fromJson(Map<String, dynamic> json) => _StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}
