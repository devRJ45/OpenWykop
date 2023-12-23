import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'alert.g.dart';

@JsonSerializable()

class Alert extends ApiModel {

  String? type;
  String? text;

  Alert(
    this.type,
    this.text,
  );

  @override
  factory Alert.fromJson(Map<String, dynamic> json) => _$AlertFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$AlertToJson(this);

  static List<Alert?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : Alert.fromJson(e as Map<String, dynamic>)).toList();
  }

}