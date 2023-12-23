// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentActions _$CommentActionsFromJson(Map<String, dynamic> json) =>
    CommentActions(
      json['update'] as bool?,
      json['delete'] as bool?,
      json['vote_up'] as bool?,
      json['vote_down'] as bool?,
      json['create_favourite'] as bool?,
      json['delete_favourite'] as bool?,
    );

Map<String, dynamic> _$CommentActionsToJson(CommentActions instance) =>
    <String, dynamic>{
      'update': instance.update,
      'delete': instance.delete,
      'vote_up': instance.voteUp,
      'vote_down': instance.voteDown,
      'create_favourite': instance.createFavourite,
      'delete_favourite': instance.deleteFavourite,
    };
