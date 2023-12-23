import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'url.g.dart';

@JsonSerializable()

class Url extends ApiModel {

  String? url;
  
  Url(
    this.url
  );

  @override
  factory Url.fromJson(Map<String, dynamic> json) => _$UrlFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$UrlToJson(this);

  static List<Url?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : Url.fromJson(e as Map<String, dynamic>)).toList();
  }

}