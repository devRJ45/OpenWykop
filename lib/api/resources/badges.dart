import 'package:openwykop/api/api_properties.dart';
import 'package:openwykop/api/api_request_response.dart';
import 'package:openwykop/api/resources/resoruces.dart';

import '../api_output.dart';
import '../api_output_list.dart';
import '../api_request.dart';
import '../models/models.dart';

class BadgesResource extends ApiResource {
  BadgesResource (ApiProperties apiProperties) : super(apiProperties, 'badges');

  Future<ApiOutputList<BadgesList>> getAll () async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath]).request();

    return ApiOutputList<BadgesList>(result, BadgesList.fromJsonList);
  }

  Future<ApiOutput<Badge>> getBadge (String badgeSlug) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, badgeSlug]).request();

    return ApiOutput<Badge>(result, Badge.fromJson);
  }

  Future<ApiOutputList<Profile>> getUsersWithBadge (String badgeSlug) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, badgeSlug, 'users']).request();

    return ApiOutputList<Profile>(result, Profile.fromJsonList);
  }

}