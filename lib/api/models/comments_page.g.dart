// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentsPage _$CommentsPageFromJson(Map<String, dynamic> json) => CommentsPage(
      (json['items'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['count'] as int?,
    );

Map<String, dynamic> _$CommentsPageToJson(CommentsPage instance) =>
    <String, dynamic>{
      'items': instance.items,
      'count': instance.count,
    };
