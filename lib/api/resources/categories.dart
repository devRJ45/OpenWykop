import 'package:openwykop/api/api_properties.dart';
import 'package:openwykop/api/api_request_response.dart';
import 'package:openwykop/api/resources/resoruces.dart';

import '../api_output_list.dart';
import '../api_request.dart';
import '../models/models.dart';

class CategoriesResource extends ApiResource {
  CategoriesResource (ApiProperties apiProperties) : super(apiProperties, 'categories');

  Future<ApiOutputList<Category>> getAll () async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath]).request();

    return ApiOutputList<Category>(result, Category.fromJsonList);
  }

}