import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'badge.g.dart';

@JsonSerializable()

class Badge extends ApiModel {

  String? label;
  String? slug;
  String? description;
  String? type;
  Media? media;
  Color? color;
  int? level;
  int? progress;
  @JsonKey(name: 'archived_at')
  String? archivedAt;

  Badge(
    this.label,
    this.slug,
    this.description,
    this.type,
    this.media,
    this.color,
    this.level,
    this.progress,
    this.archivedAt,
  );

  @override
  factory Badge.fromJson(Map<String, dynamic> json) => _$BadgeFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$BadgeToJson(this);

  static List<Badge?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : Badge.fromJson(e as Map<String, dynamic>)).toList();
  }

}