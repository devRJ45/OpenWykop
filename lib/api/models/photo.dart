import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'photo.g.dart';

@JsonSerializable()

class Photo extends ApiModel {

  String? key;
  String? label;
  @JsonKey(name: 'mime_type')
  String? mimeType;
  String? url;
  int? size;
  int? width;
  int? height;

  Photo(
    this.key,
    this.label,
    this.mimeType,
    this.url,
    this.size,
    this.width,
    this.height,
  );

  String? getThumbnailUrl () {
    if (url == null) {
      return null;
    }

    int extensionPosition = url!.lastIndexOf('.');
    
    if (extensionPosition < 0) {
      return null;
    }

    return '${url!.substring(0, extensionPosition)},w800${url!.substring(extensionPosition)}';
  }

  @override
  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PhotoToJson(this);

  static List<Photo?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : Photo.fromJson(e as Map<String, dynamic>)).toList();
  }

}