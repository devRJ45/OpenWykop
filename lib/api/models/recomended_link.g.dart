// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recomended_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecomendedLink _$RecomendedLinkFromJson(Map<String, dynamic> json) =>
    RecomendedLink(
      json['resource'] as String?,
      json['title'] as String?,
      json['description'] as String?,
      json['target_url'] as String?,
      json['image_url'] as String?,
    );

Map<String, dynamic> _$RecomendedLinkToJson(RecomendedLink instance) =>
    <String, dynamic>{
      'resource': instance.resource,
      'title': instance.title,
      'description': instance.description,
      'target_url': instance.targetTrl,
      'image_url': instance.imageUrl,
    };
