// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'badge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Badge _$BadgeFromJson(Map<String, dynamic> json) => Badge(
      json['label'] as String?,
      json['slug'] as String?,
      json['description'] as String?,
      json['type'] as String?,
      json['media'] == null
          ? null
          : Media.fromJson(json['media'] as Map<String, dynamic>),
      json['color'] == null
          ? null
          : Color.fromJson(json['color'] as Map<String, dynamic>),
      json['level'] as int?,
      json['progress'] as int?,
      json['archived_at'] as String?,
    );

Map<String, dynamic> _$BadgeToJson(Badge instance) => <String, dynamic>{
      'label': instance.label,
      'slug': instance.slug,
      'description': instance.description,
      'type': instance.type,
      'media': instance.media,
      'color': instance.color,
      'level': instance.level,
      'progress': instance.progress,
      'archived_at': instance.archivedAt,
    };
