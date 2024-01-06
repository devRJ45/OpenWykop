import 'package:openwykop/api/api_output.dart';
import 'package:openwykop/api/api_properties.dart';
import 'package:openwykop/api/api_request_response.dart';
import 'package:openwykop/api/resources/resoruces.dart';

import '../api_request.dart';
import '../models/models.dart';

class FavouritesResource extends ApiResource {
  FavouritesResource (ApiProperties apiProperties) : super(apiProperties, 'favourites');

  Future<ApiOutput<Color>> getColors () async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'colors']).request();

    return ApiOutput(result, Color.fromJson);
  }

}