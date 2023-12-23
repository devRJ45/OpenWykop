// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'related.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Related _$RelatedFromJson(Map<String, dynamic> json) => Related(
      json['editable'] as bool?,
      json['id'] as int?,
      json['title'] as String?,
      json['created_at'] as String?,
      json['author'] == null
          ? null
          : ProfileShort.fromJson(json['author'] as Map<String, dynamic>),
      json['media'] == null
          ? null
          : Media.fromJson(json['media'] as Map<String, dynamic>),
      json['source'] == null
          ? null
          : RelatedSource.fromJson(json['source'] as Map<String, dynamic>),
      json['votes'] == null
          ? null
          : RelatedVotes.fromJson(json['votes'] as Map<String, dynamic>),
      json['voted'] as int?,
      json['adult'] as bool?,
      json['actions'] == null
          ? null
          : RelatedActions.fromJson(json['actions'] as Map<String, dynamic>),
      json['archive'] as bool?,
      json['deleted'] as String?,
    );

Map<String, dynamic> _$RelatedToJson(Related instance) => <String, dynamic>{
      'editable': instance.editable,
      'id': instance.id,
      'title': instance.title,
      'created_at': instance.createdAt,
      'author': instance.author,
      'media': instance.media,
      'source': instance.source,
      'votes': instance.votes,
      'voted': instance.voted,
      'adult': instance.adult,
      'actions': instance.actions,
      'archive': instance.archive,
      'deleted': instance.deleted,
    };
