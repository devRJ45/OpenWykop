import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'search_output_users.g.dart';

@JsonSerializable()

class SearchOutputUsers extends ApiModel {

  int? total;
  List<ProfileShort>? items;

  SearchOutputUsers(
    this.total,
    this.items,
  );

  @override
  factory SearchOutputUsers.fromJson(Map<String, dynamic> json) => _$SearchOutputUsersFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$SearchOutputUsersToJson(this);

  static List<SearchOutputUsers?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : SearchOutputUsers.fromJson(e as Map<String, dynamic>)).toList();
  }

}