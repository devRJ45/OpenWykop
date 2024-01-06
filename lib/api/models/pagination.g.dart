// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      json['per_page'] as int?,
      json['total'] as int?,
      json['next'] as String?,
      json['prev'] as String?,
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'per_page': instance.perPage,
      'total': instance.total,
      'next': instance.next,
      'prev': instance.prev,
    };
