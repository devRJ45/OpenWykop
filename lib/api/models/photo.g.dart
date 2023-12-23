// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photo _$PhotoFromJson(Map<String, dynamic> json) => Photo(
      json['key'] as String?,
      json['label'] as String?,
      json['mime_type'] as String?,
      json['url'] as String?,
      json['size'] as int?,
      json['width'] as int?,
      json['height'] as int?,
    );

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'key': instance.key,
      'label': instance.label,
      'mime_type': instance.mime_type,
      'url': instance.url,
      'size': instance.size,
      'width': instance.width,
      'height': instance.height,
    };
