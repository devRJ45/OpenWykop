// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinkActions _$LinkActionsFromJson(Map<String, dynamic> json) => LinkActions(
      json['update'] as bool?,
      json['delete'] as bool?,
      json['vote_up'] as bool?,
      json['vote_down'] as bool?,
      json['undo_vote'] as bool?,
      json['create_favourite'] as bool?,
      json['delete_favourite'] as bool?,
      json['report'] as bool?,
      json['create_ama'] as bool?,
      json['finish_ama'] as bool?,
    );

Map<String, dynamic> _$LinkActionsToJson(LinkActions instance) =>
    <String, dynamic>{
      'update': instance.update,
      'delete': instance.delete,
      'vote_up': instance.vote_up,
      'vote_down': instance.voteDown,
      'undo_vote': instance.undoVote,
      'create_favourite': instance.createFavourite,
      'delete_favourite': instance.deleteFavourite,
      'report': instance.report,
      'create_ama': instance.createAma,
      'finish_ama': instance.finishAma,
    };
