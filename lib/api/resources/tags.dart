import 'package:openwykop/api/api_properties.dart';
import 'package:openwykop/api/api_request_response.dart';
import 'package:openwykop/api/resources/resoruces.dart';

import '../api_output.dart';
import '../api_output_list.dart';
import '../api_request.dart';
import '../models/models.dart';

class TagsResource extends ApiResource {
  TagsResource (ApiProperties apiProperties) : super(apiProperties, 'tags');

  Future<ApiOutputList<AutocompleteTag>> autocomplete (String query) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'autocomplete'], queryParameters: {'query': query}).request();

    return ApiOutputList<AutocompleteTag>(result, AutocompleteTag.fromJsonList);
  }

  Future<ApiOutputList<Tag>> getPopularTags () async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'popular']).request();

    return ApiOutputList<Tag>(result, Tag.fromJsonList);
  }

  Future<ApiOutputList<TagInfo>> getPopularUserTags () async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'popular-user-tags']).request();

    return ApiOutputList<TagInfo>(result, TagInfo.fromJsonList);
  }

  Future<ApiOutputList<TagInfo>> getRelatedTags (String tagName) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, tagName, 'related']).request();

    return ApiOutputList<TagInfo>(result, TagInfo.fromJsonList);
  }

  Future<ApiOutput<Tag>> getTag (String tagName) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, tagName]).request();

    return ApiOutput<Tag>(result, Tag.fromJson);
  }

  Future<ApiOutput> editTag (String tagName, String description, [String? photoKey]) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, tagName], method: RequestMethod.PUT, bodyData: {
      'photo': photoKey,
      'description': description
    }).request();

    return ApiOutput(result);
  }

  Future<ApiOutputList<StreamItem>> getTagStream (String tagName, {int? page, int? limit, String? sort, String? type, int? year, int? month}) async {
    Map<String, String> queryParameters = {};
    if (page != null) queryParameters['page'] = page.toString();
    if (limit != null) queryParameters['limit'] = limit.toString();
    if (sort != null) queryParameters['sort'] = sort;
    if (type != null) queryParameters['type'] = type;
    if (year != null) queryParameters['year'] = year.toString();
    if (month != null) queryParameters['month'] = month.toString();

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, tagName, 'stream'], queryParameters: queryParameters).request();

    return ApiOutputList<StreamItem>(result);
  }

  Future<ApiOutput<Count>> getTagNewer (String tagName, {String? type, String? sort, String? date, int? id}) async {
    Map<String, String> queryParameters = {};
    if (type != null) queryParameters['type'] = type;
    if (sort != null) queryParameters['sort'] = sort;
    if (date != null) queryParameters['date'] = date;
    if (id != null) queryParameters['id'] = id.toString();

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, tagName, 'newer'], queryParameters: queryParameters).request();

    return ApiOutput<Count>(result, Count.fromJson);
  }

  Future<ApiOutputList<Author>> getTagCoauthors (String tagName) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, tagName, 'users']).request();

    return ApiOutputList<Author>(result, Author.fromJsonList);
  }

  Future<ApiOutput> addTagCoauthor (String tagName, String username) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, tagName, 'users', username], method: RequestMethod.POST).request();

    return ApiOutput(result);
  }

  Future<ApiOutput> removeTagCoauthor (String tagName, String username) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, tagName, 'users', username], method: RequestMethod.DELETE).request();

    return ApiOutput(result);
  }
}

