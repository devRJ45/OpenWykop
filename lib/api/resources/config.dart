import 'package:openwykop/api/api_output_list.dart';
import 'package:openwykop/api/api_properties.dart';
import 'package:openwykop/api/api_request_response.dart';
import 'package:openwykop/api/resources/resoruces.dart';

import '../api_request.dart';
import '../models/models.dart';

class ConfigResource extends ApiResource {
  ConfigResource (ApiProperties apiProperties) : super(apiProperties, 'config');

  Future<ApiOutputList<Color>> getColors () async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'colors']).request();

    return ApiOutputList(result, Color.fromJsonList);
  }

}