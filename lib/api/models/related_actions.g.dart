// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'related_actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelatedActions _$RelatedActionsFromJson(Map<String, dynamic> json) =>
    RelatedActions(
      json['update'] as bool?,
      json['delete'] as bool?,
      json['vote_up'] as bool?,
      json['vote_down'] as bool?,
      json['report'] as bool?,
    );

Map<String, dynamic> _$RelatedActionsToJson(RelatedActions instance) =>
    <String, dynamic>{
      'update': instance.update,
      'delete': instance.delete,
      'vote_up': instance.voteUp,
      'vote_down': instance.voteDown,
      'report': instance.report,
    };
