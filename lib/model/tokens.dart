import 'package:json_annotation/json_annotation.dart';
part 'tokens.g.dart';

@JsonSerializable()
class Tokens{
  String? tokenAddress;

  Tokens(this.tokenAddress);

  factory Tokens.fromJson(Map<String, dynamic> json) => _$TokensFromJson(json);

  Map<String, dynamic> toJson() => _$TokensToJson(this);
}