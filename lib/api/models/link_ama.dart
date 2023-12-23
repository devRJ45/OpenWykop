import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'link_ama.g.dart';

@JsonSerializable()

class LinkAma extends ApiModel {

  bool? muted;
  bool? verified;
  LinkAmaClosed? closed;

  LinkAma(
    this.muted,
    this.verified,
    this.closed,
  );

  @override
  factory LinkAma.fromJson(Map<String, dynamic> json) => _$LinkAmaFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$LinkAmaToJson(this);

  static List<LinkAma?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : LinkAma.fromJson(e as Map<String, dynamic>)).toList();
  }

}