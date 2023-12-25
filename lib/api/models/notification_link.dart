import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'notification_link.g.dart';

@JsonSerializable()

class NotificationLink extends ApiModel {
  
  int? id;
  String? title;
  String? slug;

  NotificationLink(
    this.id,
    this.title,
    this.slug,
  );

  @override
  factory NotificationLink.fromJson(Map<String, dynamic> json) => _$NotificationLinkFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$NotificationLinkToJson(this);

  static List<NotificationLink?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : NotificationLink.fromJson(e as Map<String, dynamic>)).toList();
  }

}