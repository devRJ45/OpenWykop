// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Media _$MediaFromJson(Map<String, dynamic> json) => Media(
      json['photo'] == null
          ? null
          : Photo.fromJson(json['photo'] as Map<String, dynamic>),
      json['embed'] == null
          ? null
          : Embed.fromJson(json['embed'] as Map<String, dynamic>),
      json['survey'] == null
          ? null
          : Survey.fromJson(json['survey'] as Map<String, dynamic>),
      json['icon'] == null
          ? null
          : Photo.fromJson(json['icon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'photo': instance.photo,
      'embed': instance.embed,
      'survey': instance.survey,
      'icon': instance.icon,
    };
