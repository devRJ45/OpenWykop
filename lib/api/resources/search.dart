import 'package:openwykop/api/api_properties.dart';
import 'package:openwykop/api/api_request_response.dart';
import 'package:openwykop/api/resources/resoruces.dart';

import '../api_output.dart';
import '../api_output_list.dart';
import '../api_request.dart';
import '../models/models.dart';

class SearchResource extends ApiResource {
  SearchResource (ApiProperties apiProperties) : super(apiProperties, 'search');

  Future<ApiOutput<SearchOutput>> searchAll ({String? query, String? sort, int? votes, String? dateFrom, String? dateTo, String? domains, String? users, String? tags, String? category, String? bucket}) async {
    Map<String, String> queryParameters = {};
    if (query != null) queryParameters['query'] = query;
    if (sort != null) queryParameters['sort'] = sort;
    if (votes != null) queryParameters['votes'] = votes.toString();
    if (dateFrom != null) queryParameters['date_from'] = dateFrom;
    if (dateTo != null) queryParameters['date_to'] = dateTo;
    if (domains != null) queryParameters['domains'] = domains;
    if (users != null) queryParameters['users'] = users;
    if (tags != null) queryParameters['tags'] = tags;
    if (category != null) queryParameters['category'] = category;
    if (bucket != null) queryParameters['bucket'] = bucket;

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'all'], queryParameters: queryParameters).request();

    return ApiOutput<SearchOutput>(result, SearchOutput.fromJson);
  }

  Future<ApiOutputList<Link>> searchLinks ({String? query, String? sort, int? votes, String? dateFrom, String? dateTo, String? domains, String? users, String? tags, String? category, String? bucket, int? page, int? limit}) async {
    Map<String, String> queryParameters = {};
    if (query != null) queryParameters['query'] = query;
    if (sort != null) queryParameters['sort'] = sort;
    if (votes != null) queryParameters['votes'] = votes.toString();
    if (dateFrom != null) queryParameters['date_from'] = dateFrom;
    if (dateTo != null) queryParameters['date_to'] = dateTo;
    if (domains != null) queryParameters['domains'] = domains;
    if (users != null) queryParameters['users'] = users;
    if (tags != null) queryParameters['tags'] = tags;
    if (category != null) queryParameters['category'] = category;
    if (bucket != null) queryParameters['bucket'] = bucket;
    if (page != null) queryParameters['page'] = page.toString();
    if (limit != null) queryParameters['limit'] = limit.toString();

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'links'], queryParameters: queryParameters).request();

    return ApiOutputList<Link>(result, Link.fromJsonList);
  }

  Future<ApiOutputList<Entry>> searchEntries ({String? query, String? sort, int? votes, String? dateFrom, String? dateTo, String? domains, String? users, String? tags, String? category, String? bucket, int? page, int? limit}) async {
    Map<String, String> queryParameters = {};
    if (query != null) queryParameters['query'] = query;
    if (sort != null) queryParameters['sort'] = sort;
    if (votes != null) queryParameters['votes'] = votes.toString();
    if (dateFrom != null) queryParameters['date_from'] = dateFrom;
    if (dateTo != null) queryParameters['date_to'] = dateTo;
    if (domains != null) queryParameters['domains'] = domains;
    if (users != null) queryParameters['users'] = users;
    if (tags != null) queryParameters['tags'] = tags;
    if (category != null) queryParameters['category'] = category;
    if (bucket != null) queryParameters['bucket'] = bucket;
    if (page != null) queryParameters['page'] = page.toString();
    if (limit != null) queryParameters['limit'] = limit.toString();

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'entries'], queryParameters: queryParameters).request();

    return ApiOutputList<Entry>(result, Entry.fromJsonList);
  }

  Future<ApiOutputList<ProfileShort>> searchUsers ({String? query, String? users, int? page, String? sort}) async {
    Map<String, String> queryParameters = {};
    if (query != null) queryParameters['query'] = query;
    if (users != null) queryParameters['users'] = users;
    if (page != null) queryParameters['page'] = page.toString();
    if (sort != null) queryParameters['sort'] = sort;
    

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'users'], queryParameters: queryParameters).request();

    return ApiOutputList<ProfileShort>(result, ProfileShort.fromJsonList);
  }

}

