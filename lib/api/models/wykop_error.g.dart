// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wykop_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WykopError _$WykopErrorFromJson(Map<String, dynamic> json) => WykopError(
      json['code'] as int?,
      json['hash'] as String?,
      json['error'] == null
          ? null
          : WykopErrorMessage.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WykopErrorToJson(WykopError instance) =>
    <String, dynamic>{
      'code': instance.code,
      'hash': instance.hash,
      'error': instance.error,
    };
