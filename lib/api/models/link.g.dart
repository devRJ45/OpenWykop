// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Link _$LinkFromJson(Map<String, dynamic> json) => Link(
      json['editable'] as bool?,
      json['id'] as int?,
      json['created_at'] as String?,
      json['title'] as String?,
      json['slug'] as String?,
      json['description'] as String?,
      json['source'] == null
          ? null
          : LinkSource.fromJson(json['source'] as Map<String, dynamic>),
      json['author'] == null
          ? null
          : ProfileShort.fromJson(json['author'] as Map<String, dynamic>),
      json['published_at'] as String?,
      json['votes'] == null
          ? null
          : LinkVotes.fromJson(json['votes'] as Map<String, dynamic>),
      json['voted'] as int?,
      json['comments'] == null
          ? null
          : LinkComments.fromJson(json['comments'] as Map<String, dynamic>),
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['hot'] as bool?,
      json['adult'] as bool?,
      json['media'] == null
          ? null
          : Media.fromJson(json['media'] as Map<String, dynamic>),
      json['deletable'] as bool?,
      json['resource'] as String?,
      json['actions'] == null
          ? null
          : LinkActions.fromJson(json['actions'] as Map<String, dynamic>),
      json['archive'] as bool?,
      json['deleted'] as String?,
    );

Map<String, dynamic> _$LinkToJson(Link instance) => <String, dynamic>{
      'resource': instance.resource,
      'editable': instance.editable,
      'id': instance.id,
      'created_at': instance.createdAt,
      'title': instance.title,
      'slug': instance.slug,
      'description': instance.description,
      'source': instance.source,
      'author': instance.author,
      'published_at': instance.publishedAt,
      'votes': instance.votes,
      'voted': instance.voted,
      'comments': instance.comments,
      'tags': instance.tags,
      'hot': instance.hot,
      'adult': instance.adult,
      'media': instance.media,
      'deletable': instance.deletable,
      'actions': instance.actions,
      'archive': instance.archive,
      'deleted': instance.deleted,
    };
