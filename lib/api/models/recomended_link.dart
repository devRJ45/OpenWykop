import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'recomended_link.g.dart';

@JsonSerializable()

class RecomendedLink extends StreamItem {

  String? title;
  String? description;
  @JsonKey(name: 'target_url')
  String? targetTrl;
  @JsonKey(name: 'image_url')
  String? imageUrl;

  RecomendedLink(
    super.resource,
    this.title,
    this.description,
    this.targetTrl,
    this.imageUrl,
  );

  @override
  factory RecomendedLink.fromJson(Map<String, dynamic> json) => _$RecomendedLinkFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$RecomendedLinkToJson(this);

  static List<RecomendedLink?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : RecomendedLink.fromJson(e as Map<String, dynamic>)).toList();
  }

}