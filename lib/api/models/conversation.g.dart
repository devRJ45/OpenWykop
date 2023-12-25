// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Conversation _$ConversationFromJson(Map<String, dynamic> json) => Conversation(
      json['user'] == null
          ? null
          : ProfileShort.fromJson(json['user'] as Map<String, dynamic>),
      (json['messages'] as List<dynamic>?)
          ?.map((e) => ConversationMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['actions'] == null
          ? null
          : ConversationActions.fromJson(
              json['actions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConversationToJson(Conversation instance) =>
    <String, dynamic>{
      'user': instance.user,
      'messages': instance.messages,
      'actions': instance.actions,
    };
