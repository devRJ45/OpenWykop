// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinkSource _$LinkSourceFromJson(Map<String, dynamic> json) => LinkSource(
      json['label'] as String?,
      json['url'] as String?,
      json['type'] as String?,
      json['type_id'] as int?,
    );

Map<String, dynamic> _$LinkSourceToJson(LinkSource instance) =>
    <String, dynamic>{
      'label': instance.label,
      'url': instance.url,
      'type': instance.type,
      'type_id': instance.typeId,
    };
