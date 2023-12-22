// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autocomplete_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AutocompleteUser _$AutocompleteUserFromJson(Map<String, dynamic> json) =>
    AutocompleteUser(
      json['username'] as String?,
      json['color'] as String?,
      json['gender'] as String?,
      json['avatar'] as String?,
      json['followers_qty'] as int?,
    );

Map<String, dynamic> _$AutocompleteUserToJson(AutocompleteUser instance) =>
    <String, dynamic>{
      'username': instance.username,
      'color': instance.color,
      'gender': instance.gender,
      'avatar': instance.avatar,
      'followers_qty': instance.followersQty,
    };
