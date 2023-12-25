import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'notifications_status.g.dart';

@JsonSerializable()

class NotificationsStatus extends ApiModel {

  bool? pm;
  @JsonKey(name: 'pm_notification')
  bool? pmNotification;
  @JsonKey(name: 'entry_notification')
  bool? entryNotification;
  @JsonKey(name: 'tag_notification')
  bool? tagNotification;
  @JsonKey(name: 'pm_notification_count')
  int? pmNotificationCount;
  @JsonKey(name: 'entry_notification_count')
  int? entryNotificationCount;
  @JsonKey(name: 'tag_notification_count')
  int? tagNotificationCount;

  NotificationsStatus(
    this.pm,
    this.pmNotification,
    this.entryNotification,
    this.tagNotification,
    this.pmNotificationCount,
    this.entryNotificationCount,
    this.tagNotificationCount,
  );

  @override
  factory NotificationsStatus.fromJson(Map<String, dynamic> json) => _$NotificationsStatusFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$NotificationsStatusToJson(this);

  static List<NotificationsStatus?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : NotificationsStatus.fromJson(e as Map<String, dynamic>)).toList();
  }

}