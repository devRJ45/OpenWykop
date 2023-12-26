import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'search_output_links.g.dart';

@JsonSerializable()

class SearchOutputLinks extends ApiModel {

  int? total;
  List<Link>? items;

  SearchOutputLinks(
    this.total,
    this.items,
  );

  @override
  factory SearchOutputLinks.fromJson(Map<String, dynamic> json) => _$SearchOutputLinksFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$SearchOutputLinksToJson(this);

  static List<SearchOutputLinks?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : SearchOutputLinks.fromJson(e as Map<String, dynamic>)).toList();
  }

}