// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
      json['type'] as String?,
      json['id'] as String?,
      json['read'] as int?,
      json['created_at'] as String?,
      json['user'] == null
          ? null
          : ProfileShort.fromJson(json['user'] as Map<String, dynamic>),
      json['comment'] == null
          ? null
          : NotificationComment.fromJson(
              json['comment'] as Map<String, dynamic>),
      json['link'] == null
          ? null
          : NotificationLink.fromJson(json['link'] as Map<String, dynamic>),
      json['entry'] == null
          ? null
          : NotificationEntry.fromJson(json['entry'] as Map<String, dynamic>),
      json['msg'] as String?,
      json['badge'] == null
          ? null
          : NotificationBadge.fromJson(json['badge'] as Map<String, dynamic>),
      json['issue'] == null
          ? null
          : NotificationIssue.fromJson(json['issue'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'read': instance.read,
      'created_at': instance.createdAt,
      'user': instance.user,
      'comment': instance.comment,
      'link': instance.link,
      'entry': instance.entry,
      'msg': instance.msg,
      'badge': instance.badge,
      'issue': instance.issue,
    };
