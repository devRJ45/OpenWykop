// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationMessage _$ConversationMessageFromJson(Map<String, dynamic> json) =>
    ConversationMessage()
      ..createdAt = json['created_at'] as String?
      ..content = json['content'] as String?
      ..type = json['type'] as int?
      ..adult = json['adult'] as bool?
      ..media = json['media'] == null
          ? null
          : Media.fromJson(json['media'] as Map<String, dynamic>)
      ..read = json['read'] as bool?
      ..key = json['key'] as String?
      ..actions = json['actions'] == null
          ? null
          : ConversationMessageActions.fromJson(
              json['actions'] as Map<String, dynamic>);

Map<String, dynamic> _$ConversationMessageToJson(
        ConversationMessage instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt,
      'content': instance.content,
      'type': instance.type,
      'adult': instance.adult,
      'media': instance.media,
      'read': instance.read,
      'key': instance.key,
      'actions': instance.actions,
    };
