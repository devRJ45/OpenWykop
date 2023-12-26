// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bucket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bucket _$BucketFromJson(Map<String, dynamic> json) => Bucket(
      json['title'] as String?,
      json['query'] as String?,
      json['hash'] as String?,
      json['slug'] as String?,
      json['new'] as bool?,
      json['default_page'] as String?,
    );

Map<String, dynamic> _$BucketToJson(Bucket instance) => <String, dynamic>{
      'title': instance.title,
      'query': instance.query,
      'hash': instance.hash,
      'slug': instance.slug,
      'new': instance.haveNew,
      'default_page': instance.defaultPage,
    };
