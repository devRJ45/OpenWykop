import 'package:openwykop/api/api_properties.dart';
import 'package:openwykop/api/api_request_response.dart';
import 'package:openwykop/api/resources/resoruces.dart';

import '../api_output.dart';
import '../api_output_list.dart';
import '../api_request.dart';
import '../models/models.dart';

class MicroblogResource extends ApiResource {
  MicroblogResource (ApiProperties apiProperties) : super(apiProperties, 'entries');

  Future<ApiOutputList<Entry>> getEntries ({int? page, String? pageHash, int? limit, String? category, String? bucket, String? sort, int? lastUpdate}) async {
    Map<String, String> queryParameters = {};
    if (page != null) queryParameters['page'] = page.toString();
    if (pageHash != null) queryParameters['page'] = pageHash;
    if (limit != null) queryParameters['limit'] = limit.toString();
    if (category != null) queryParameters['category'] = category;
    if (bucket != null) queryParameters['bucket'] = bucket;
    if (sort != null) queryParameters['sort'] = sort;
    if (lastUpdate != null) queryParameters['last-update'] = lastUpdate.toString();
    
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath], queryParameters: queryParameters).request();

    return ApiOutputList<Entry>(result, Entry.fromJsonList);
  }

  Future<ApiOutput<Entry>> addEntry (String content, bool adult, [String? photoKey, String? embedKey, String? surveyKey]) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath], method: RequestMethod.POST, bodyData: {
      'content': content,
      'photo': photoKey,
      'embed': embedKey,
      'survey': surveyKey,
      'adult': adult,
    }).request();

    return ApiOutput<Entry>(result, Entry.fromJson);
  }

  Future<ApiOutput<Entry>> getEntry (int entryId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, entryId.toString()]).request();

    return ApiOutput<Entry>(result, Entry.fromJson);
  }

  Future<ApiOutput<Entry>> editEntry (int entryId, String content, bool adult, [String? photoKey, String? embedKey, String? surveyKey]) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, entryId.toString()], method: RequestMethod.PUT, bodyData: {
      'content': content,
      'photo': photoKey,
      'embed': embedKey,
      'survey': surveyKey,
      'adult': adult,
    }).request();

    return ApiOutput<Entry>(result, Entry.fromJson);
  }

  Future<ApiOutput> removeEntry (int entryId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, entryId.toString()], method: RequestMethod.DELETE).request();

    return ApiOutput(result);
  }

  Future<ApiOutputList<ProfileShort>> getVotes (int entryId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, entryId.toString(), 'votes']).request();

    return ApiOutputList<ProfileShort>(result, ProfileShort.fromJsonList);
  }

  Future<ApiOutput> voteEntry (int entryId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, entryId.toString(), 'votes'], method: RequestMethod.POST).request();

    return ApiOutput(result);
  }

  Future<ApiOutput> backVoteEntry (int entryId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, entryId.toString(), 'votes'], method: RequestMethod.DELETE).request();

    return ApiOutput(result);
  }

  Future<ApiOutput<Count>> getNewer (int entryId, [String? category]) async {
    Map<String, String> queryParameters = {};
    if (category != null) queryParameters['category'] = category.toString();

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, entryId.toString(), 'newer'], queryParameters: queryParameters).request();

    return ApiOutput<Count>(result, Count.fromJson);
  }

  Future<ApiOutputList<Comment>> getComments (int entryId, {int? page, int? limit}) async {
    Map<String, String> queryParameters = {};
    if (page != null) queryParameters['page'] = page.toString();
    if (limit != null) queryParameters['limit'] = limit.toString();

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, entryId.toString(), 'comments'], queryParameters: queryParameters).request();

    return ApiOutputList<Comment>(result, Comment.fromJsonList);
  }

  Future<ApiOutput<Comment>> addComment (int entryId, String content, bool adult, [String? photoKey, String? embedKey]) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, entryId.toString(), 'comments'], method: RequestMethod.POST, bodyData: {
      'content': content,
      'photo': photoKey,
      'embed': embedKey,
      'adult': adult,
    }).request();

    return ApiOutput<Comment>(result, Comment.fromJson);
  }

  Future<ApiOutput<Count>> getNewerComments (int entryId, [String? date]) async {
    Map<String, String> queryParameters = {};
    if (date != null) queryParameters['date'] = date.toString();

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, entryId.toString(), 'comments', 'newer'], queryParameters: queryParameters).request();

    return ApiOutput<Count>(result, Count.fromJson);
  }

  Future<ApiOutput<Comment>> getComment (int entryId, int commentId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, entryId.toString(), 'comments', commentId.toString()]).request();

    return ApiOutput<Comment>(result, Comment.fromJson);
  }

  Future<ApiOutput<Comment>> editComment (int entryId, int commentId, String content, bool adult, [String? photoKey, String? embedKey]) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, entryId.toString(), 'comments', commentId.toString()], method: RequestMethod.PUT, bodyData: {
      'content': content,
      'photo': photoKey,
      'embed': embedKey,
      'adult': adult,
    }).request();

    return ApiOutput<Comment>(result, Comment.fromJson);
  }

  Future<ApiOutput> removeComment (int entryId, int commentId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, entryId.toString(), 'comments', commentId.toString()], method: RequestMethod.DELETE).request();

    return ApiOutput(result);
  }

  Future<ApiOutputList<ProfileShort>> getCommentVotes (int entryId, int commentId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, entryId.toString(), 'comments', commentId.toString(), 'votes']).request();

    return ApiOutputList<ProfileShort>(result, ProfileShort.fromJsonList);
  }

  Future<ApiOutput> voteComment (int entryId, int commentId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, entryId.toString(), 'comments', commentId.toString(), 'votes'], method: RequestMethod.POST).request();

    return ApiOutput(result);
  }

  Future<ApiOutput> backVoteComment (int entryId, int commentId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, entryId.toString(), 'comments', commentId.toString(), 'votes'], method: RequestMethod.DELETE).request();

    return ApiOutput(result);
  }

  Future<ApiOutput<SurveyId>> createSurvey (String question, List<String> answers) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'survey'], method: RequestMethod.POST, bodyData: {
      'question': question,
      'answers': answers,
    }).request();

    return ApiOutput<SurveyId>(result, SurveyId.fromJson);
  }

  Future<ApiOutput> voteSurvey (int entryId, int vote) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, entryId.toString(), 'survey', 'votes'], method: RequestMethod.POST, bodyData: {
      'vote': vote
    }).request();

    return ApiOutput(result);
  }

}

