import 'package:json_annotation/json_annotation.dart';
part 'images.g.dart';

@JsonSerializable()
class Images{
  @JsonKey(name:'16x16')
  String? size16;

  @JsonKey(name:'200x200')
  String? size200;

  @JsonKey(name:'60x60')
  String? size60;

  Images(
    this.size16,
    this.size200,
    this.size60,
  );

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}