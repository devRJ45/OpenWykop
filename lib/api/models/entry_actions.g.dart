// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry_actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntryActions _$EntryActionsFromJson(Map<String, dynamic> json) => EntryActions(
      json['update'] as bool?,
      json['delete'] as bool?,
      json['vote_up'] as bool?,
      json['create_favourite'] as bool?,
      json['delete_favourite'] as bool?,
      json['report'] as bool?,
    );

Map<String, dynamic> _$EntryActionsToJson(EntryActions instance) =>
    <String, dynamic>{
      'update': instance.update,
      'delete': instance.delete,
      'vote_up': instance.voteUp,
      'create_favourite': instance.createFavourite,
      'delete_favourite': instance.deleteFavourite,
      'report': instance.report,
    };
