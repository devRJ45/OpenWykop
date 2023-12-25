// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_short.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageShort _$MessageShortFromJson(Map<String, dynamic> json) => MessageShort(
      json['created_at'] as String?,
      json['content'] as String?,
      json['type'] as int?,
      json['adult'] as bool?,
    );

Map<String, dynamic> _$MessageShortToJson(MessageShort instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt,
      'content': instance.content,
      'type': instance.type,
      'adult': instance.adult,
    };
