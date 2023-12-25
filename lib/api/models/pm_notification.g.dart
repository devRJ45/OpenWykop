// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pm_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PMNotification _$PMNotificationFromJson(Map<String, dynamic> json) =>
    PMNotification(
      json['type'] as String?,
      json['id'] as String?,
      json['read'] as int?,
      json['created_at'] as String?,
      json['user'] == null
          ? null
          : ProfileShort.fromJson(json['user'] as Map<String, dynamic>),
      json['content'] as String?,
    );

Map<String, dynamic> _$PMNotificationToJson(PMNotification instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'read': instance.read,
      'created_at': instance.createdAt,
      'user': instance.user,
      'content': instance.content,
    };
