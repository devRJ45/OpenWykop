import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'search_output_entries.g.dart';

@JsonSerializable()

class SearchOutputEntries extends ApiModel {

  int? total;
  List<Entry>? items;

  SearchOutputEntries(
    this.total,
    this.items,
  );

  @override
  factory SearchOutputEntries.fromJson(Map<String, dynamic> json) => _$SearchOutputEntriesFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$SearchOutputEntriesToJson(this);

  static List<SearchOutputEntries?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : SearchOutputEntries.fromJson(e as Map<String, dynamic>)).toList();
  }

}