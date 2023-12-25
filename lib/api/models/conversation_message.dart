import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'conversation_message.g.dart';

@JsonSerializable()

class ConversationMessage extends ApiModel {

  @JsonKey(name: 'created_at')
  String? createdAt;
  String? content;
  int? type;
  bool? adult;
  Media? media;
  bool? read;
  String? key;
  ConversationMessageActions? actions;

  ConversationMessage(
    
  );

  @override
  factory ConversationMessage.fromJson(Map<String, dynamic> json) => _$ConversationMessageFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ConversationMessageToJson(this);

  static List<ConversationMessage?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : ConversationMessage.fromJson(e as Map<String, dynamic>)).toList();
  }

}