// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_header.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryHeader _$CategoryHeaderFromJson(Map<String, dynamic> json) =>
    CategoryHeader(
      json['title'] as String?,
      json['description'] as String?,
      json['url'] as String?,
      json['media'] == null
          ? null
          : Media.fromJson(json['media'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryHeaderToJson(CategoryHeader instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'media': instance.media,
    };
