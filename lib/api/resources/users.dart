import 'package:openwykop/api/api_properties.dart';
import 'package:openwykop/api/resources/resoruces.dart';

import '../api_output_list.dart';
import '../api_request.dart';
import '../models/models.dart';

class UsersResource extends ApiResource {
  UsersResource (ApiProperties apiProperties) : super(apiProperties, 'users');

  Future<ApiOutputList<AutocompleteUser>> autocomplete (String query) async {
    Map<String, dynamic> result = await ApiRequest(apiProperties, [resourcePath, 'autocomplete'], queryParameters: {'query': query}).request();

    return ApiOutputList<AutocompleteUser>(result, AutocompleteUser.fromJsonList);
  }
}