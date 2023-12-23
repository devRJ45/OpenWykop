import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'link_source.g.dart';

@JsonSerializable()

class LinkSource extends ApiModel {

  String? label;
  String? url;
  String? type;
  @JsonKey(name: 'type_id')
  int? typeId;

  LinkSource(
    this.label,
    this.url,
    this.type,
    this.typeId,
  );

  @override
  factory  LinkSource.fromJson(Map<String, dynamic> json) => _$LinkSourceFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$LinkSourceToJson(this);

  static List<LinkSource?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : LinkSource.fromJson(e as Map<String, dynamic>)).toList();
  }

}