// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blacklist_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlacklistUser _$BlacklistUserFromJson(Map<String, dynamic> json) =>
    BlacklistUser(
      json['username'] as String?,
      json['created_at'] as String?,
      json['gender'] as String?,
      json['color'] as String?,
      json['avatar'] as String?,
    );

Map<String, dynamic> _$BlacklistUserToJson(BlacklistUser instance) =>
    <String, dynamic>{
      'username': instance.username,
      'created_at': instance.createdAt,
      'gender': instance.gender,
      'color': instance.color,
      'avatar': instance.avatar,
    };
