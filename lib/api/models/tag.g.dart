// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tag _$TagFromJson(Map<String, dynamic> json) => Tag(
      json['editable'] as bool?,
      json['created_at'] as String?,
      json['name'] as String?,
      json['author'] == null
          ? null
          : ProfileShort.fromJson(json['author'] as Map<String, dynamic>),
      json['personal'] as bool?,
      json['media'] == null
          ? null
          : Media.fromJson(json['media'] as Map<String, dynamic>),
      json['description'] as String?,
      json['followers'] as int?,
      json['follow'] as bool?,
      json['notifications'] as bool?,
      json['blacklist'] as bool?,
      json['promoted'] as bool?,
      json['actions'] == null
          ? null
          : TagActions.fromJson(json['actions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'editable': instance.editable,
      'created_at': instance.createdAt,
      'name': instance.name,
      'author': instance.author,
      'personal': instance.personal,
      'media': instance.media,
      'description': instance.description,
      'followers': instance.followers,
      'follow': instance.follow,
      'notifications': instance.notifications,
      'blacklist': instance.blacklist,
      'promoted': instance.promoted,
      'actions': instance.actions,
    };
