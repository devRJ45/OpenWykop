import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'badges_list.g.dart';

@JsonSerializable()

class BadgesList extends ApiModel {

  List<Badge>? items;

  BadgesList(
    this.items
  );

  @override
  factory BadgesList.fromJson(Map<String, dynamic> json) => _$BadgesListFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$BadgesListToJson(this);

  static List<BadgesList?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : BadgesList.fromJson({'items': e})).toList();
  }

}