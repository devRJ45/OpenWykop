import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'parent_location.g.dart';

@JsonSerializable()

class ParentLocation extends ApiModel {

  String? filter;
  int? page;

  ParentLocation(
    this.filter,
    this.page,
  );

  @override
  factory  ParentLocation.fromJson(Map<String, dynamic> json) => _$ParentLocationFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ParentLocationToJson(this);

  static List<ParentLocation?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : ParentLocation.fromJson(e as Map<String, dynamic>)).toList();
  }

}