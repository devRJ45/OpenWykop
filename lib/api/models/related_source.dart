import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'related_source.g.dart';

@JsonSerializable()

class RelatedSource extends ApiModel {

  String? label;
  String? url;

  RelatedSource(
    this.label,
    this.url
  );

  @override
  factory RelatedSource.fromJson(Map<String, dynamic> json) => _$RelatedSourceFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$RelatedSourceToJson(this);

  static List<RelatedSource?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : RelatedSource.fromJson(e as Map<String, dynamic>)).toList();
  }

}