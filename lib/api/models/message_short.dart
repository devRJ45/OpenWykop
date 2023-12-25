import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'message_short.g.dart';

@JsonSerializable()

class MessageShort extends ApiModel {

  @JsonKey(name: 'created_at')
  String? createdAt;
  String? content;
  int? type;
  bool? adult;

  MessageShort(
    this.createdAt,
    this.content,
    this.type,
    this.adult,
  );

  @override
  factory MessageShort.fromJson(Map<String, dynamic> json) => _$MessageShortFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$MessageShortToJson(this);

  static List<MessageShort?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : MessageShort.fromJson(e as Map<String, dynamic>)).toList();
  }

}