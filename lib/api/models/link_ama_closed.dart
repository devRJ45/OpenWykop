import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'link_ama_closed.g.dart';

@JsonSerializable()

class LinkAmaClosed extends ApiModel {

  @JsonKey(name: 'ended_at')
  String? endedAt;
  String? text;

  LinkAmaClosed(
    this.endedAt,
    this.text,
  );

  @override
  factory LinkAmaClosed.fromJson(Map<String, dynamic> json) => _$LinkAmaClosedFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$LinkAmaClosedToJson(this);

  static List<LinkAmaClosed?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : LinkAmaClosed.fromJson(e as Map<String, dynamic>)).toList();
  }

}