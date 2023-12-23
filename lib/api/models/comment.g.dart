// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
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
      json['votes'] == null
          ? null
          : CommentVotes.fromJson(json['votes'] as Map<String, dynamic>),
      json['deletable'] as bool?,
      json['blacklist'] as bool?,
      json['deleted'] as String?,
      json['resource'] as String?,
      json['actions'] == null
          ? null
          : CommentActions.fromJson(json['actions'] as Map<String, dynamic>),
      json['archive'] as bool?,
      json['slug'] as String?,
      json['parent'] == null
          ? null
          : CommentParent.fromJson(json['parent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
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
      'votes': instance.votes,
      'deletable': instance.deletable,
      'blacklist': instance.blacklist,
      'deleted': instance.deleted,
      'actions': instance.actions,
      'archive': instance.archive,
      'slug': instance.slug,
      'parent': instance.parent,
    };
