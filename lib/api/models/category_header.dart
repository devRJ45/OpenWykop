import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'category_header.g.dart';

@JsonSerializable()

class CategoryHeader extends ApiModel {

  String? title;
  String? description;
  String? url;
  Media? media;

  CategoryHeader(
    this.title,
    this.description,
    this.url,
    this.media,
  );

  @override
  factory CategoryHeader.fromJson(Map<String, dynamic> json) => _$CategoryHeaderFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$CategoryHeaderToJson(this);

  static List<CategoryHeader?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : CategoryHeader.fromJson(e as Map<String, dynamic>)).toList();
  }

}