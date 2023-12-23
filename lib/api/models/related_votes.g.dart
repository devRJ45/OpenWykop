// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'related_votes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelatedVotes _$RelatedVotesFromJson(Map<String, dynamic> json) => RelatedVotes(
      json['up'] as int?,
      json['down'] as int?,
      json['count'] as int?,
    );

Map<String, dynamic> _$RelatedVotesToJson(RelatedVotes instance) =>
    <String, dynamic>{
      'up': instance.up,
      'down': instance.down,
      'count': instance.count,
    };
