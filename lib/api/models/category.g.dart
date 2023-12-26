// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      json['name'] as String?,
      json['slug'] as String?,
      json['pathname'] as String?,
      json['active'] as bool?,
      json['color'] == null
          ? null
          : Color.fromJson(json['color'] as Map<String, dynamic>),
      json['primary_tag'] as String?,
      json['media'] == null
          ? null
          : Media.fromJson(json['media'] as Map<String, dynamic>),
      json['header'] == null
          ? null
          : CategoryHeader.fromJson(json['header'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'name': instance.name,
      'slug': instance.slug,
      'pathname': instance.pathname,
      'active': instance.active,
      'color': instance.color,
      'primary_tag': instance.primaryTag,
      'media': instance.media,
      'header': instance.header,
    };
