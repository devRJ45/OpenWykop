import 'package:openwykop/api/api_properties.dart';
import 'package:openwykop/api/api_request_response.dart';
import 'package:openwykop/api/resources/resoruces.dart';

import '../api_output.dart';
import '../api_output_list.dart';
import '../api_request.dart';
import '../models/models.dart';

class ProfilesResource extends ApiResource {
  ProfilesResource (ApiProperties apiProperties) : super(apiProperties, 'profile');

  Future<ApiOutput<Profile>> getLoggedProfile () async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath]).request();

    return ApiOutput<Profile>(result, Profile.fromJson);
  }

  Future<ApiOutput<ProfileShort>> getLoggedProfileShort () async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'short']).request();

    return ApiOutput<ProfileShort>(result, ProfileShort.fromJson);
  }

  Future<ApiOutput<Profile>> getProfile ([String? username]) async {
    if (username == null) {
      return getLoggedProfile();
    }

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'users', username]).request();

    return ApiOutput<Profile>(result, Profile.fromJson);
  }

  Future<ApiOutput<ProfileShort>> getProfileShort ([String? username]) async {
    if (username == null) {
      return getLoggedProfileShort();
    }

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'users', username, 'short']).request();

    return ApiOutput<ProfileShort>(result, ProfileShort.fromJson);
  }

  Future<ApiOutputList<StreamItem>> getProfileActions (String username, {int? page, int? limit}) async {
    Map<String, String> queryParameters = {};
    if (page != null) queryParameters['page'] = page.toString();
    if (limit != null) queryParameters['limit'] = limit.toString();

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'users', username, 'actions'], queryParameters: queryParameters).request();

    return ApiOutputList<StreamItem>(result);
  }

  Future<ApiOutputList<Entry>> getProfileAddedEntries (String username, {int? page, int? limit}) async {
    Map<String, String> queryParameters = {};
    if (page != null) queryParameters['page'] = page.toString();
    if (limit != null) queryParameters['limit'] = limit.toString();

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'users', username, 'entries', 'added'], queryParameters: queryParameters).request();

    return ApiOutputList<Entry>(result, Entry.fromJsonList);
  }

  Future<ApiOutputList<Entry>> getProfileVotedEntries (String username, {int? page, int? limit}) async {
    Map<String, String> queryParameters = {};
    if (page != null) queryParameters['page'] = page.toString();
    if (limit != null) queryParameters['limit'] = limit.toString();

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'users', username, 'entries', 'voted'], queryParameters: queryParameters).request();

    return ApiOutputList<Entry>(result, Entry.fromJsonList);
  }

  Future<ApiOutputList<Entry>> getProfileCommentedEntries (String username, {int? page, int? limit}) async {
    Map<String, String> queryParameters = {};
    if (page != null) queryParameters['page'] = page.toString();
    if (limit != null) queryParameters['limit'] = limit.toString();

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'users', username, 'entries', 'commented'], queryParameters: queryParameters).request();

    return ApiOutputList<Entry>(result, Entry.fromJsonList);
  }

  Future<ApiOutputList<Link>> getProfileAddedLinks (String username, {int? page, int? limit}) async {
    Map<String, String> queryParameters = {};
    if (page != null) queryParameters['page'] = page.toString();
    if (limit != null) queryParameters['limit'] = limit.toString();

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'users', username, 'links', 'added'], queryParameters: queryParameters).request();

    return ApiOutputList<Link>(result, Link.fromJsonList);
  }

  Future<ApiOutputList<Link>> getProfilePublishedLinks (String username, {int? page, int? limit}) async {
    Map<String, String> queryParameters = {};
    if (page != null) queryParameters['page'] = page.toString();
    if (limit != null) queryParameters['limit'] = limit.toString();

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'users', username, 'links', 'published'], queryParameters: queryParameters).request();

    return ApiOutputList<Link>(result, Link.fromJsonList);
  }

  Future<ApiOutputList<Link>> getProfileUpVotedLinks (String username, {int? page, int? limit}) async {
    Map<String, String> queryParameters = {};
    if (page != null) queryParameters['page'] = page.toString();
    if (limit != null) queryParameters['limit'] = limit.toString();

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'users', username, 'links', 'up'], queryParameters: queryParameters).request();

    return ApiOutputList<Link>(result, Link.fromJsonList);
  }

  Future<ApiOutputList<Link>> getProfileDownVotedLinks (String username, {int? page, int? limit}) async {
    Map<String, String> queryParameters = {};
    if (page != null) queryParameters['page'] = page.toString();
    if (limit != null) queryParameters['limit'] = limit.toString();

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'users', username, 'links', 'down'], queryParameters: queryParameters).request();

    return ApiOutputList<Link>(result, Link.fromJsonList);
  }

  Future<ApiOutputList<Link>> getProfileCommentedLinks (String username, {int? page, int? limit}) async {
    Map<String, String> queryParameters = {};
    if (page != null) queryParameters['page'] = page.toString();
    if (limit != null) queryParameters['limit'] = limit.toString();

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'users', username, 'links', 'commented'], queryParameters: queryParameters).request();

    return ApiOutputList<Link>(result, Link.fromJsonList);
  }

  Future<ApiOutputList<Link>> getProfileRelatedLinks (String username, {int? page, int? limit}) async {
    Map<String, String> queryParameters = {};
    if (page != null) queryParameters['page'] = page.toString();
    if (limit != null) queryParameters['limit'] = limit.toString();

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'users', username, 'links', 'related'], queryParameters: queryParameters).request();

    return ApiOutputList<Link>(result, Link.fromJsonList);
  }

  Future<ApiOutputList<Badge>> getProfileBadges (String username) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'users', username, 'badges']).request();

    return ApiOutputList<Badge>(result, Badge.fromJsonList);
  }

  Future<ApiOutputList<TagInfo>> getProfileTags (String username) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'users', username, 'tags']).request();

    return ApiOutputList<TagInfo>(result, TagInfo.fromJsonList);
  }

  Future<ApiOutputList<TagInfo>> getProfileObservedTags (String username) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'users', username, 'observed', 'tags']).request();

    return ApiOutputList<TagInfo>(result, TagInfo.fromJsonList);
  }

  Future<ApiOutputList<ProfileShort>> getProfileFollowingUsers (String username, [int? page]) async {
    Map<String, String> queryParameters = {};
    if (page != null) queryParameters['page'] = page.toString();

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'users', username, 'observed', 'users', 'following'], queryParameters: queryParameters).request();

    return ApiOutputList<ProfileShort>(result, ProfileShort.fromJsonList);
  }
  
  Future<ApiOutputList<ProfileShort>> getProfileFollowers (String username, [int? page]) async {
    Map<String, String> queryParameters = {};
    if (page != null) queryParameters['page'] = page.toString();

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'users', username, 'observed', 'users', 'followers'], queryParameters: queryParameters).request();

    return ApiOutputList<ProfileShort>(result, ProfileShort.fromJsonList);
  }
}

