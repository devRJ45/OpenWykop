import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'notification_badge.g.dart';

@JsonSerializable()

class NotificationBadge extends ApiModel {
  
  String? name;
  String? slug;

  NotificationBadge(
    this.name,
    this.slug,
  );

  @override
  factory NotificationBadge.fromJson(Map<String, dynamic> json) => _$NotificationBadgeFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$NotificationBadgeToJson(this);

  static List<NotificationBadge?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : NotificationBadge.fromJson(e as Map<String, dynamic>)).toList();
  }

}