import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'search_output.g.dart';

@JsonSerializable()

class SearchOutput extends ApiModel {

  SearchOutputLinks? links;
  SearchOutputEntries? entries;
  SearchOutputUsers? users;

  SearchOutput(
    this.links,
    this.entries,
    this.users,
  );

  @override
  factory SearchOutput.fromJson(Map<String, dynamic> json) => _$SearchOutputFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$SearchOutputToJson(this);

  static List<SearchOutput?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : SearchOutput.fromJson(e as Map<String, dynamic>)).toList();
  }

}