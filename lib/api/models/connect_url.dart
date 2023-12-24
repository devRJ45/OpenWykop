import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'connect_url.g.dart';

@JsonSerializable()

class ConnectUrl extends ApiModel {

  @JsonKey(name: 'connect_url')
  String? connectUrl;

  ConnectUrl(
    this.connectUrl,
  );

  @override
  factory ConnectUrl.fromJson(Map<String, dynamic> json) => _$ConnectUrlFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ConnectUrlToJson(this);

  static List<ConnectUrl?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : ConnectUrl.fromJson(e as Map<String, dynamic>)).toList();
  }

}