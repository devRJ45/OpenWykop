import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'conversation_message_actions.g.dart';

@JsonSerializable()

class ConversationMessageActions extends ApiModel {

  bool? create;
  bool? delete;

  ConversationMessageActions(
    this.create,
    this.delete,
  );

  @override
  factory ConversationMessageActions.fromJson(Map<String, dynamic> json) => _$ConversationMessageActionsFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ConversationMessageActionsToJson(this);

  static List<ConversationMessageActions?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : ConversationMessageActions.fromJson(e as Map<String, dynamic>)).toList();
  }

}