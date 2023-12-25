// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationsStatus _$NotificationsStatusFromJson(Map<String, dynamic> json) =>
    NotificationsStatus(
      json['pm'] as bool?,
      json['pm_notification'] as bool?,
      json['entry_notification'] as bool?,
      json['tag_notification'] as bool?,
      json['pm_notification_count'] as int?,
      json['entry_notification_count'] as int?,
      json['tag_notification_count'] as int?,
    );

Map<String, dynamic> _$NotificationsStatusToJson(
        NotificationsStatus instance) =>
    <String, dynamic>{
      'pm': instance.pm,
      'pm_notification': instance.pmNotification,
      'entry_notification': instance.entryNotification,
      'tag_notification': instance.tagNotification,
      'pm_notification_count': instance.pmNotificationCount,
      'entry_notification_count': instance.entryNotificationCount,
      'tag_notification_count': instance.tagNotificationCount,
    };
