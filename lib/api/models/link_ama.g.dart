// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_ama.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinkAma _$LinkAmaFromJson(Map<String, dynamic> json) => LinkAma(
      json['muted'] as bool?,
      json['verified'] as bool?,
      json['closed'] == null
          ? null
          : LinkAmaClosed.fromJson(json['closed'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LinkAmaToJson(LinkAma instance) => <String, dynamic>{
      'muted': instance.muted,
      'verified': instance.verified,
      'closed': instance.closed,
    };
