// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileActions _$ProfileActionsFromJson(Map<String, dynamic> json) =>
    ProfileActions(
      json['update'] as bool?,
      json['update_gender'] as bool?,
      json['update_note'] as bool?,
      json['blacklist'] as bool?,
      json['follow'] as bool?,
    );

Map<String, dynamic> _$ProfileActionsToJson(ProfileActions instance) =>
    <String, dynamic>{
      'update': instance.update,
      'update_gender': instance.updateGender,
      'update_note': instance.updateNote,
      'blacklist': instance.blacklist,
      'follow': instance.follow,
    };
