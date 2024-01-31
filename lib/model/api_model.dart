import 'package:json_annotation/json_annotation.dart';
import 'meta.dart';
import 'status_model.dart';
import 'data_model.dart';
part 'api_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ApiModel {
  List<Data?> data;

  Status? status;

  Meta? meta;

  ApiModel(
    this.data,
    this.status,
    this.meta
  );

  factory ApiModel.fromJson(Map<String, dynamic> json) =>
      _$ApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiModelToJson(this);
}
