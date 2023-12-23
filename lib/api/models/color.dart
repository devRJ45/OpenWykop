import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'color.g.dart';

@JsonSerializable()

class Color extends ApiModel {

  String? hex;
  @JsonKey(name: 'hex_dark')
  String? hexDark;

  Color(
    this.hex,
    this.hexDark,
  );

  @override
  factory Color.fromJson(Map<String, dynamic> json) => _$ColorFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ColorToJson(this);

  static List<Color?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : Color.fromJson(e as Map<String, dynamic>)).toList();
  }

}