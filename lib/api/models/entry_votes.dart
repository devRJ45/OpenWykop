import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'entry_votes.g.dart';

@JsonSerializable()

class EntryVotes extends ApiModel {

  int? up;
  int? down;
  List<ProfileShort>? users;

  EntryVotes(
    this.up,
    this.down,
    this.users
  );

  @override
  factory  EntryVotes.fromJson(Map<String, dynamic> json) => _$EntryVotesFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$EntryVotesToJson(this);

  static List<EntryVotes?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : EntryVotes.fromJson(e as Map<String, dynamic>)).toList();
  }

}