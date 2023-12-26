import 'package:openwykop/api/api_properties.dart';
import 'package:openwykop/api/api_request_response.dart';
import 'package:openwykop/api/resources/resoruces.dart';

import '../api_output.dart';
import '../api_output_list.dart';
import '../api_request.dart';
import '../models/models.dart';

class ObservedResource extends ApiResource {
  ObservedResource (ApiProperties apiProperties) : super(apiProperties, 'observed');

  Future<ApiOutputList<StreamItem>> getObservedUsersStream ({String? pageHash}) async {
    Map<String, String> queryParameters = {};
    if (pageHash != null) queryParameters['page'] = pageHash;

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'users'], queryParameters: queryParameters).request();

    return ApiOutputList<StreamItem>(result);
  }

  Future<ApiOutput<Count>> getObservedUsersStreamNewer ({String? date, int? id}) async {
    Map<String, String> queryParameters = {};
    if (date != null) queryParameters['date'] = date;
    if (id != null) queryParameters['id'] = id.toString();

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'users', 'newer'], queryParameters: queryParameters).request();

    return ApiOutput<Count>(result, Count.fromJson);
  }

  Future<ApiOutput> observeUser (String username) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'users', username], method: RequestMethod.POST).request();

    return ApiOutput(result);
  }

  Future<ApiOutput> unobserveUser (String username) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'users', username], method: RequestMethod.DELETE).request();

    return ApiOutput(result);
  }

  Future<ApiOutput> observeTag (String tag) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'tags', tag], method: RequestMethod.POST).request();

    return ApiOutput(result);
  }

  Future<ApiOutput> unobserveTag (String tag) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'tags', tag], method: RequestMethod.DELETE).request();

    return ApiOutput(result);
  }

  Future<ApiOutputList<StreamItem>> getObservedTagsStream ({String? pageHash}) async {
    Map<String, String> queryParameters = {};
    if (pageHash != null) queryParameters['page'] = pageHash;

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'tags', 'stream'], queryParameters: queryParameters).request();

    return ApiOutputList<StreamItem>(result);
  }

  Future<ApiOutputList<StreamItem>> getObservedStream ({String? pageHash}) async {
    Map<String, String> queryParameters = {};
    if (pageHash != null) queryParameters['page'] = pageHash;

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'all'], queryParameters: queryParameters).request();

    return ApiOutputList<StreamItem>(result);
  }

  Future<ApiOutput> enableTagNotifications (String tag) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'tags', tag, 'notifications'], method: RequestMethod.PUT).request();

    return ApiOutput(result);
  }

  Future<ApiOutput> disableTagNotifications (String tag) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'tags', tag, 'notifications'], method: RequestMethod.DELETE).request();

    return ApiOutput(result);
  }

}

