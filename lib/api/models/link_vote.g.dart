// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_vote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinkVote _$LinkVoteFromJson(Map<String, dynamic> json) => LinkVote(
      json['user'] == null
          ? null
          : ProfileShort.fromJson(json['user'] as Map<String, dynamic>),
      json['created_at'] as String?,
      json['reason'] as String?,
    );

Map<String, dynamic> _$LinkVoteToJson(LinkVote instance) => <String, dynamic>{
      'user': instance.user,
      'created_at': instance.createdAt,
      'reason': instance.reason,
    };
