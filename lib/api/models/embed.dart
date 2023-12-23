import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'embed.g.dart';

@JsonSerializable()

class Embed extends ApiModel {

  String? key;
  String? type;
  String? url;
  String? thumbnail;

  Embed(
    this.key,
    this.type,
    this.url,
    this.thumbnail,
  );

  @override
  factory  Embed.fromJson(Map<String, dynamic> json) => _$EmbedFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$EmbedToJson(this);

  static List<Embed?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : Embed.fromJson(e as Map<String, dynamic>)).toList();
  }

}