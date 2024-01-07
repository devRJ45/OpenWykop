import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'tag_info.g.dart';

@JsonSerializable()

class TagInfo extends ApiModel {

  String? name;

  TagInfo(
    this.name,
  );

  @override
  factory TagInfo.fromJson(Map<String, dynamic> json) => _$TagInfoFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$TagInfoToJson(this);

  static List<TagInfo?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : TagInfo.fromJson(e as Map<String, dynamic>)).toList();
  }

}