import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'blacklist_tag.g.dart';

@JsonSerializable()

class BlacklistTag extends ApiModel {

  String? name;
  @JsonKey(name: 'created_at')
  String? createdAt;

  BlacklistTag(
    this.name,
    this.createdAt,
  );

  @override
  factory BlacklistTag.fromJson(Map<String, dynamic> json) => _$BlacklistTagFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$BlacklistTagToJson(this);

  static List<BlacklistTag?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : BlacklistTag.fromJson(e as Map<String, dynamic>)).toList();
  }

}