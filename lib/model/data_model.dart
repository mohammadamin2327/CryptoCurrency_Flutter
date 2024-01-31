import 'package:json_annotation/json_annotation.dart';
import 'values.dart';
import 'images.dart';
import 'tokens.dart';
import 'links.dart';
part 'data_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Data {
  num? id;
  num? rank;
  String? slug;
  String? name;
  String? symbol;
  String? category;
  String? type;
  num? volume24hBase;
  num? circulatingSupply;
  num? totalSupply;
  num? maxSupply;
  Values? values;
  String? lastUpdated;
  List<Tokens>? tokens;
  List<Links>? links;
  Images? images;

  Data(
    this.id,
    this.rank,
    this.slug,
    this.name,
    this.symbol,
    this.category,
    this.type,
    this.volume24hBase,
    this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.values,
    this.lastUpdated,
    this.tokens,
    this.links,
    this.images,
  );

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
