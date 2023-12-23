// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_votes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentVotes _$CommentVotesFromJson(Map<String, dynamic> json) => CommentVotes(
      json['up'] as int?,
      json['down'] as int?,
      (json['users'] as List<dynamic>?)
          ?.map((e) => Author.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommentVotesToJson(CommentVotes instance) =>
    <String, dynamic>{
      'up': instance.up,
      'down': instance.down,
      'users': instance.users,
    };
