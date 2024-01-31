import 'package:json_annotation/json_annotation.dart';
import 'usd.dart';
part 'values.g.dart';

@JsonSerializable(explicitToJson: true)
class Values{
  @JsonKey(name: 'USD')
  Usd? usd;

  Values(this.usd);

  factory Values.fromJson(Map<String, dynamic> json) =>
      _$ValuesFromJson(json);

  Map<String, dynamic> toJson() => _$ValuesToJson(this);

}