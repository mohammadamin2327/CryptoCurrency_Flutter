import 'package:json_annotation/json_annotation.dart';
part 'api_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ApiModel {
  
  ApiModel({required dynamic status, required List<dynamic> data}) {
    if (status != null) {
      status = status;
    }
    if (data != null) {
      data = data;
    }
  }

  dynamic status;
  List<dynamic> data;

  factory ApiModel.fromJson(Map<String, dynamic> json) => _$ApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiModelToJson(this);
}
