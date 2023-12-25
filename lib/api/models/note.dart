import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'note.g.dart';

@JsonSerializable()

class Note extends ApiModel {

  String? username;
  String? content;

  Note(
    this.username,
    this.content,
  );

  @override
  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$NoteToJson(this);

  static List<Note?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : Note.fromJson(e as Map<String, dynamic>)).toList();
  }

}