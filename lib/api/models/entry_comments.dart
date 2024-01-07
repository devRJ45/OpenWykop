import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'entry_comments.g.dart';

@JsonSerializable()

class EntryComments extends ApiModel {

  List<Comment>? items;
  int? count;

  EntryComments(
    this.items,
    this.count,
  );

  @override
  factory EntryComments.fromJson(Map<String, dynamic> json) => _$EntryCommentsFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$EntryCommentsToJson(this);

  static List<EntryComments?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : EntryComments.fromJson(e as Map<String, dynamic>)).toList();
  }

}