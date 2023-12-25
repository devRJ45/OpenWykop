import 'package:openwykop/api/api_output.dart';
import 'package:openwykop/api/api_properties.dart';
import 'package:openwykop/api/api_request_response.dart';
import 'package:openwykop/api/resources/resoruces.dart';

import '../api_output_list.dart';
import '../api_request.dart';
import '../models/models.dart';

class FavouritesResource extends ApiResource {
  FavouritesResource (ApiProperties apiProperties) : super(apiProperties, 'favourites');

  Future<ApiOutput> add (String type, int sourceId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath], method: RequestMethod.POST, bodyData: {
      'type': type,
      'source_id': sourceId,
    }).request();

    return ApiOutput(result);
  }

  Future<ApiOutput> remove (String type, int sourceId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath], method: RequestMethod.DELETE, bodyData: {
      'type': type,
      'source_id': sourceId,
    }).request();

    return ApiOutput(result);
  }

  Future<ApiOutputList<StreamItem>> getAll ({int? page, String? sort, String? resource}) async {
    Map<String, String> queryParameters = {};
    if (page != null) queryParameters['page'] = page.toString();
    if (sort != null) queryParameters['sort'] = sort;
    if (resource != null) queryParameters['resource'] = resource;

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath], queryParameters: queryParameters).request();

    return ApiOutputList<StreamItem>(result);
  }

}