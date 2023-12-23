import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'media.g.dart';

@JsonSerializable()

class Media extends ApiModel {

  Photo? photo;
  Embed? embed;
  Survey? survey;

  Media(
    this.photo,
  );

  @override
  factory  Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$MediaToJson(this);

  static List<Media?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : Media.fromJson(e as Map<String, dynamic>)).toList();
  }

}