// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_parent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentParent _$CommentParentFromJson(Map<String, dynamic> json) =>
    CommentParent(
      json['resource'] as String?,
      json['id'] as int?,
      json['slug'] as String?,
      json['author'] == null
          ? null
          : ProfileShort.fromJson(json['author'] as Map<String, dynamic>),
      (json['location'] as List<dynamic>?)
          ?.map((e) => ParentLocation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommentParentToJson(CommentParent instance) =>
    <String, dynamic>{
      'resource': instance.resource,
      'id': instance.id,
      'slug': instance.slug,
      'author': instance.author,
      'location': instance.location,
    };
