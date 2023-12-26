// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blacklist_domain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlacklistDomain _$BlacklistDomainFromJson(Map<String, dynamic> json) =>
    BlacklistDomain(
      json['domain'] as String?,
      json['created_at'] as String?,
    );

Map<String, dynamic> _$BlacklistDomainToJson(BlacklistDomain instance) =>
    <String, dynamic>{
      'domain': instance.domain,
      'created_at': instance.createdAt,
    };
