import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'pagination.g.dart';

@JsonSerializable()

class Pagination extends ApiModel {

  @JsonKey(name: 'per_page')
  int? perPage;
  int? total;

  Pagination(
    perPage,
    total,
  );

  @override
  factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PaginationToJson(this);

}