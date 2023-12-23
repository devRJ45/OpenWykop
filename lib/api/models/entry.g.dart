// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Entry _$EntryFromJson(Map<String, dynamic> json) => Entry(
      json['editable'] as bool?,
      json['id'] as int?,
      json['author'] == null
          ? null
          : ProfileShort.fromJson(json['author'] as Map<String, dynamic>),
      json['device'] as String?,
      json['created_at'] as String?,
      json['voted'] as int?,
      json['content'] as String?,
      json['media'] == null
          ? null
          : Media.fromJson(json['media'] as Map<String, dynamic>),
      json['adult'] as bool?,
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['favourite'] as bool?,
      json['deletable'] as bool?,
      json['slug'] as String?,
      json['votes'] == null
          ? null
          : EntryVotes.fromJson(json['votes'] as Map<String, dynamic>),
      json['comments'] == null
          ? null
          : EntryComments.fromJson(json['comments'] as Map<String, dynamic>),
      json['parent_id'] as int?,
      json['resource'] as String?,
      json['actions'] == null
          ? null
          : EntryActions.fromJson(json['actions'] as Map<String, dynamic>),
      json['archive'] as bool?,
      json['deleted'] as bool?,
    );

Map<String, dynamic> _$EntryToJson(Entry instance) => <String, dynamic>{
      'resource': instance.resource,
      'editable': instance.editable,
      'id': instance.id,
      'author': instance.author,
      'device': instance.device,
      'created_at': instance.createdAt,
      'voted': instance.voted,
      'content': instance.content,
      'media': instance.media,
      'adult': instance.adult,
      'tags': instance.tags,
      'favourite': instance.favourite,
      'deletable': instance.deletable,
      'slug': instance.slug,
      'votes': instance.votes,
      'comments': instance.comments,
      'parent_id': instance.parentId,
      'actions': instance.actions,
      'archive': instance.archive,
      'deleted': instance.deleted,
    };
