// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry_votes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntryVotes _$EntryVotesFromJson(Map<String, dynamic> json) => EntryVotes(
      json['up'] as int?,
      json['down'] as int?,
      (json['users'] as List<dynamic>?)
          ?.map((e) => Author.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EntryVotesToJson(EntryVotes instance) =>
    <String, dynamic>{
      'up': instance.up,
      'down': instance.down,
      'users': instance.users,
    };
