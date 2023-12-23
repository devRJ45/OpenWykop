// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry_comments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntryComments _$EntryCommentsFromJson(Map<String, dynamic> json) =>
    EntryComments(
      (json['items'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['count'] as int?,
    );

Map<String, dynamic> _$EntryCommentsToJson(EntryComments instance) =>
    <String, dynamic>{
      'items': instance.items,
      'count': instance.count,
    };
