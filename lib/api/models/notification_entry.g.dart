// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationEntry _$NotificationEntryFromJson(Map<String, dynamic> json) =>
    NotificationEntry(
      json['id'] as int?,
      json['message'] as String?,
      json['slug'] as String?,
    );

Map<String, dynamic> _$NotificationEntryToJson(NotificationEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'slug': instance.slug,
    };
