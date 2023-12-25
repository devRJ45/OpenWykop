// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_short.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationShort _$ConversationShortFromJson(Map<String, dynamic> json) =>
    ConversationShort(
      json['user'] == null
          ? null
          : ProfileShort.fromJson(json['user'] as Map<String, dynamic>),
      json['last_message'] == null
          ? null
          : MessageShort.fromJson(json['last_message'] as Map<String, dynamic>),
      json['unread'] as bool?,
    );

Map<String, dynamic> _$ConversationShortToJson(ConversationShort instance) =>
    <String, dynamic>{
      'user': instance.user,
      'last_message': instance.lastMessage,
      'unread': instance.unread,
    };
