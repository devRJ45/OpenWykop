// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_short.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileShort _$ProfileShortFromJson(Map<String, dynamic> json) => ProfileShort(
      json['username'] as String?,
      json['company'] as bool?,
      json['gender'] as String?,
      json['avatar'] as String?,
      json['note'] as bool?,
      json['online'] as bool?,
      json['status'] as String?,
      json['color'] as String?,
      json['verified'] as bool?,
      json['follow'] as bool?,
      json['rank'] == null
          ? null
          : ProfileRank.fromJson(json['rank'] as Map<String, dynamic>),
    )..actions = json['actions'] == null
        ? null
        : ProfileActions.fromJson(json['actions'] as Map<String, dynamic>);

Map<String, dynamic> _$ProfileShortToJson(ProfileShort instance) =>
    <String, dynamic>{
      'username': instance.username,
      'company': instance.company,
      'gender': instance.gender,
      'avatar': instance.avatar,
      'note': instance.note,
      'online': instance.online,
      'status': instance.status,
      'color': instance.color,
      'verified': instance.verified,
      'follow': instance.follow,
      'rank': instance.rank,
      'actions': instance.actions,
    };
