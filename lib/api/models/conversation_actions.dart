import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'conversation_actions.g.dart';

@JsonSerializable()

class ConversationActions extends ApiModel {

  bool? create;

  ConversationActions(
    this.create,
  );

  @override
  factory ConversationActions.fromJson(Map<String, dynamic> json) => _$ConversationActionsFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ConversationActionsToJson(this);

  static List<ConversationActions?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : ConversationActions.fromJson(e as Map<String, dynamic>)).toList();
  }

}