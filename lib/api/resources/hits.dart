import 'package:openwykop/api/api_properties.dart';
import 'package:openwykop/api/api_request_response.dart';
import 'package:openwykop/api/resources/resoruces.dart';

import '../api_output_list.dart';
import '../api_request.dart';
import '../models/models.dart';

class HitsResource extends ApiResource {
  HitsResource (ApiProperties apiProperties) : super(apiProperties, 'hits');

  Future<ApiOutputList<Link>> getLinks ({int? page, int? year, int? month, String? sort, int? limit}) async {
    Map<String, String> queryParameters = {};
    if (page != null) queryParameters['page'] = page.toString();
    if (year != null) queryParameters['year'] = year.toString();
    if (month != null) queryParameters['month'] = month.toString();
    if (sort != null) queryParameters['sort'] = sort;
    if (limit != null) queryParameters['limit'] = limit.toString();
    

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'links'], queryParameters: queryParameters).request();

    return ApiOutputList<Link>(result);
  }

  Future<ApiOutputList<Entry>> getEntries ({int? page, int? year, int? month, String? sort, int? limit}) async {
    Map<String, String> queryParameters = {};
    if (page != null) queryParameters['page'] = page.toString();
    if (year != null) queryParameters['year'] = year.toString();
    if (month != null) queryParameters['month'] = month.toString();
    if (sort != null) queryParameters['sort'] = sort;
    if (limit != null) queryParameters['limit'] = limit.toString();
    

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'entries'], queryParameters: queryParameters).request();

    return ApiOutputList<Entry>(result);
  }

}