import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'conversation.g.dart';

@JsonSerializable()

class Conversation extends ApiModel {

  ProfileShort? user;
  List<ConversationMessage>? messages;
  ConversationActions? actions;

  Conversation(
    this.user,
    this.messages,
    this.actions,
  );

  @override
  factory Conversation.fromJson(Map<String, dynamic> json) => _$ConversationFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ConversationToJson(this);

  static List<Conversation?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : Conversation.fromJson(e as Map<String, dynamic>)).toList();
  }

}