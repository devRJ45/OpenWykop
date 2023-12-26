// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bucket_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BucketStatus _$BucketStatusFromJson(Map<String, dynamic> json) => BucketStatus(
      json['hash'] as String?,
      json['new'] as bool?,
    );

Map<String, dynamic> _$BucketStatusToJson(BucketStatus instance) =>
    <String, dynamic>{
      'hash': instance.hash,
      'new': instance.haveNew,
    };
