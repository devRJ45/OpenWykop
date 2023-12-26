import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'category.g.dart';

@JsonSerializable()

class Category extends ApiModel {

  String? name;
  String? slug;
  String? pathname;
  bool? active;
  Color? color;
  @JsonKey(name: 'primary_tag')
  String? primaryTag;
  Media? media;
  CategoryHeader? header;

  Category(
    this.name,
    this.slug,
    this.pathname,
    this.active,
    this.color,
    this.primaryTag,
    this.media,
    this.header,
  );

  @override
  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  static List<Category?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : Category.fromJson(e as Map<String, dynamic>)).toList();
  }

}