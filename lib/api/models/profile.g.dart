// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      json['username'] as String?,
      json['company'] as bool?,
      json['gender'] as String?,
      json['avatar'] as String?,
      json['note'] as bool?,
      json['online'] as bool?,
      json['status'] as String?,
      json['color'] as String?,
      json['berified'] as bool?,
      json['follow'] as bool?,
      json['rank'] == null
          ? null
          : ProfileRank.fromJson(json['rank'] as Map<String, dynamic>),
      json['actions'] == null
          ? null
          : ProfileActions.fromJson(json['actions'] as Map<String, dynamic>),
      json['name'] as String?,
      json['city'] as String?,
      json['website'] as String?,
      json['about'] as String?,
      json['public_email'] as String?,
      json['background'] as String?,
      json['followers'] as int?,
      json['member_since'] as String?,
      json['summary'] == null
          ? null
          : ProfileSummary.fromJson(json['summary'] as Map<String, dynamic>),
      json['social_media'] == null
          ? null
          : ProfileSocialMedia.fromJson(
              json['social_media'] as Map<String, dynamic>),
      json['banned'] == null
          ? null
          : ProfileBan.fromJson(json['banned'] as Map<String, dynamic>),
      json['can_change_gender'] as bool?,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'username': instance.username,
      'company': instance.company,
      'gender': instance.gender,
      'avatar': instance.avatar,
      'note': instance.note,
      'online': instance.online,
      'status': instance.status,
      'color': instance.color,
      'berified': instance.berified,
      'follow': instance.follow,
      'rank': instance.rank,
      'actions': instance.actions,
      'name': instance.name,
      'city': instance.city,
      'website': instance.website,
      'about': instance.about,
      'public_email': instance.publicEmail,
      'background': instance.background,
      'followers': instance.followers,
      'member_since': instance.memberSince,
      'summary': instance.summary,
      'social_media': instance.socialMedia,
      'banned': instance.banned,
      'can_change_gender': instance.canChangeGender,
    };
