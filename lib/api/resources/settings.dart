import 'package:openwykop/api/api_properties.dart';
import 'package:openwykop/api/api_request_response.dart';
import 'package:openwykop/api/resources/resoruces.dart';

import '../api_output.dart';
import '../api_output_list.dart';
import '../api_request.dart';
import '../models/models.dart';

class SettingsResource extends ApiResource {
  SettingsResource (ApiProperties apiProperties) : super(apiProperties, 'settings');

  Future<ApiOutput<BlacklistStats>> getBlacklistStats () async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'blacklists', 'stats']).request();

    return ApiOutput<BlacklistStats>(result, BlacklistStats.fromJson);
  }

  Future<ApiOutputList<BlacklistDomain>> getDomainsInBlacklist ([int? page]) async {
    Map<String, String> queryParameters = {};
    if (page != null) queryParameters['page'] = page.toString();

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'blacklists', 'domains'], queryParameters: queryParameters).request();

    return ApiOutputList<BlacklistDomain>(result, BlacklistDomain.fromJsonList);
  }

  Future<ApiOutput> addDomainToBlacklist (String domain) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'blacklists', 'domains'], method: RequestMethod.POST, bodyData: {
      'domain': domain
    }).request();

    return ApiOutput(result);
  }

  Future<ApiOutput> removeDomainFromBlacklist (String domain) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'blacklists', 'domains', domain], method: RequestMethod.DELETE).request();

    return ApiOutput(result);
  }

  Future<ApiOutputList<BlacklistTag>> getTagsInBlacklist ([int? page]) async {
    Map<String, String> queryParameters = {};
    if (page != null) queryParameters['page'] = page.toString();

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'blacklists', 'tags'], queryParameters: queryParameters).request();

    return ApiOutputList<BlacklistTag>(result, BlacklistTag.fromJsonList);
  }

  Future<ApiOutput> addTagToBlacklist (String domain) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'blacklists', 'tags'], method: RequestMethod.POST, bodyData: {
      'tag': domain
    }).request();

    return ApiOutput(result);
  }

  Future<ApiOutput> removeTagFromBlacklist (String domain) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'blacklists', 'tags', domain], method: RequestMethod.DELETE).request();

    return ApiOutput(result);
  }

  Future<ApiOutputList<BlacklistUser>> getUsersInBlacklist ([int? page]) async {
    Map<String, String> queryParameters = {};
    if (page != null) queryParameters['page'] = page.toString();

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'blacklists', 'users'], queryParameters: queryParameters).request();

    return ApiOutputList<BlacklistUser>(result, BlacklistUser.fromJsonList);
  }

  Future<ApiOutput<ProfileShort>> addUserToBlacklist (String username) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'blacklists', 'users'], method: RequestMethod.POST, bodyData: {
      'username': username
    }).request();

    return ApiOutput<ProfileShort>(result, ProfileShort.fromJson);
  }

  Future<ApiOutput> removeUserFromBlacklist (String username) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'blacklists', 'users', username], method: RequestMethod.DELETE).request();

    return ApiOutput(result);
  }

}

