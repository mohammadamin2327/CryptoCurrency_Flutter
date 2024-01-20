import 'package:json_annotation/json_annotation.dart';
import 'status_model.dart';
import 'data_model.dart';
part'api_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ApiModel {
  ApiModel({required this.data, required this.status});

  Status? status;
  List<Data?>? data;

  factory ApiModel.fromJson(Map<String, dynamic> json) =>
      _$ApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiModelToJson(this);
}
