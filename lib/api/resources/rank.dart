import 'package:openwykop/api/api_properties.dart';
import 'package:openwykop/api/api_request_response.dart';
import 'package:openwykop/api/resources/resoruces.dart';

import '../api_output_list.dart';
import '../api_request.dart';
import '../models/models.dart';

class RankResource extends ApiResource {
  RankResource (ApiProperties apiProperties) : super(apiProperties, 'rank');

  Future<ApiOutputList<Profile>> getRankUsers ([int? page]) async {
    Map<String, String> queryParameters = {};
    if (page != null) queryParameters['page'] = page.toString();

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath], queryParameters: queryParameters).request();

    return ApiOutputList<Profile>(result, Profile.fromJsonList);
  }

}