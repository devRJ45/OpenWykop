import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'conversation_short.g.dart';

@JsonSerializable()

class ConversationShort extends ApiModel {

  ProfileShort? user;
  @JsonKey(name: 'last_message')
  MessageShort? lastMessage;
  bool? unread;

  ConversationShort(
    this.user,
    this.lastMessage,
    this.unread,
  );

  @override
  factory ConversationShort.fromJson(Map<String, dynamic> json) => _$ConversationShortFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ConversationShortToJson(this);

  static List<ConversationShort?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : ConversationShort.fromJson(e as Map<String, dynamic>)).toList();
  }

}