import 'package:openwykop/api/api_output.dart';
import 'package:openwykop/api/api_properties.dart';
import 'package:openwykop/api/api_request_response.dart';
import 'package:openwykop/api/resources/resoruces.dart';

import '../api_output_list.dart';
import '../api_request.dart';
import '../models/models.dart';

enum DownVoteReason {
  duplicate,
  spam,
  fake,
  wrong,
  invalid,
}

class LinksResource extends ApiResource {
  LinksResource (ApiProperties apiProperties) : super(apiProperties, 'links');

  Future<ApiOutputList<StreamItem>> getLinks ({int? page, String? pageHash, int? limit, String? sort, String? category, String? bucket}) async {
    Map<String, String> queryParameters = {};
    if (page != null) queryParameters['page'] = page.toString();
    if (pageHash != null) queryParameters['page'] = pageHash;
    if (limit != null) queryParameters['limit'] = limit.toString();
    if (sort != null) queryParameters['sort'] = sort;
    if (category != null) queryParameters['category'] = category;
    if (bucket != null) queryParameters['bucket'] = bucket;

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath], queryParameters: queryParameters).request();

    return ApiOutputList<StreamItem>(result);
  }

  Future<ApiOutput> upVoteLink (int linkId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, linkId.toString(), 'votes', 'up'], method: RequestMethod.POST).request();

    return ApiOutput(result);
  }

  Future<ApiOutput> downVoteLink (int linkId, DownVoteReason reason) async {
    String reasonValue = '1';
    switch (reason) {
      case DownVoteReason.duplicate:
        reasonValue = '1';
        break;
      case DownVoteReason.spam:
        reasonValue = '2';
        break;
      case DownVoteReason.fake:
        reasonValue = '3';
        break;
      case DownVoteReason.wrong:
        reasonValue = '4';
        break;
      case DownVoteReason.invalid:
        reasonValue = '5';
        break;
    }
    
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, linkId.toString(), 'votes', 'down', reasonValue], method: RequestMethod.POST).request();

    return ApiOutput(result);
  }

  Future<ApiOutput<Count>> getUpcomingLinks ({String? category, String? bucket}) async {
    Map<String, String> queryParameters = {};
    if (category != null) queryParameters['category'] = category;
    if (bucket != null) queryParameters['bucket'] = bucket;

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'stats', 'upcoming'], queryParameters: queryParameters).request();

    return ApiOutput<Count>(result, Link.fromJson);
  }

  Future<ApiOutput<Link>> getLinkByUrl (String url) async {
    Map<String, String> queryParameters = {'url': url};

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'url'], queryParameters: queryParameters).request();

    return ApiOutput<Link>(result, Link.fromJson);
  }

  Future<ApiOutput> backVoteLink (int linkId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, linkId.toString(), 'votes'], method: RequestMethod.DELETE).request();

    return ApiOutput(result);
  }

  Future<ApiOutput<Link>> getLink (int linkId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, linkId.toString()]).request();

    return ApiOutput<Link>(result, Link.fromJson);
  }

  Future<ApiOutput> editLink (int linkId, String title, String description, List<String> tags, bool adult, [String? photoKey]) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, linkId.toString()], method: RequestMethod.PUT, bodyData: {
      'title': title,
      'description': description,
      'tags': tags,
      'photo': photoKey,
      'adult': adult,
    }).request();

    return ApiOutput(result);
  }

  Future<ApiOutput> removeLink (int linkId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, linkId.toString()], method: RequestMethod.DELETE).request();

    return ApiOutput(result);
  }

  Future<ApiOutputList<LinkVote>> getLinkUpVotes (int linkId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, linkId.toString(), 'upvotes', 'up']).request();

    return ApiOutputList<LinkVote>(result, LinkVote.fromJsonList);
  }

  Future<ApiOutputList<LinkVote>> getLinkDownVotes (int linkId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, linkId.toString(), 'upvotes', 'down']).request();

    return ApiOutputList<LinkVote>(result, LinkVote.fromJsonList);
  }

  Future<ApiOutput<Url>> getLinkUrl (int linkId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, linkId.toString(), 'redirect']).request();

    return ApiOutput<Url>(result, Url.fromJson);
  }

  //related section
  Future<ApiOutputList<Related>> getRelated (int linkId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, linkId.toString(), 'related']).request();

    return ApiOutputList<Related>(result, Related.fromJsonList);
  }

  Future<ApiOutput> addRelated (int linkId, String title, String url, bool adult) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, linkId.toString(), 'related'], method: RequestMethod.POST, bodyData: {
      'title': title,
      'url': url,
      'adult': adult,
    }).request();

    return ApiOutput(result);
  }

  Future<ApiOutput> removeRelated (int linkId, int relatedId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, linkId.toString(), 'related', relatedId.toString()], method: RequestMethod.DELETE).request();

    return ApiOutput(result);
  }

  Future<ApiOutput> updateRelated (int linkId, int relatedId, String title, String url, bool adult) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, linkId.toString(), 'related', relatedId.toString()], method: RequestMethod.PUT, bodyData: {
      'title': title,
      'url': url,
      'adult': adult,
    }).request();

    return ApiOutput(result);
  }

  Future<ApiOutput> backVoteRelated (int linkId, int relatedId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, linkId.toString(), 'related', relatedId.toString(), 'votes'], method: RequestMethod.DELETE).request();

    return ApiOutput(result);
  }

  
  Future<ApiOutput> upVoteRelated (int linkId, int relatedId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, linkId.toString(), 'related', relatedId.toString(), 'votes', 'up'], method: RequestMethod.POST).request();

    return ApiOutput(result);
  }

  Future<ApiOutput> downVoteRelated (int linkId, int relatedId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, linkId.toString(), 'related', relatedId.toString(), 'votes', 'down'], method: RequestMethod.POST).request();

    return ApiOutput(result);
  }

  //ama section
  Future<ApiOutput> startAma (int linkId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, linkId.toString(), 'ama', 'start'], method: RequestMethod.PUT).request();

    return ApiOutput(result);
  }

  Future<ApiOutput> finishAma (int linkId, String content) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, linkId.toString(), 'ama', 'finish'], method: RequestMethod.POST, bodyData: {
      'content': content
    }).request();

    return ApiOutput(result);
  }

  //comments section
  Future<ApiOutputList<Comment>> getComments (int linkId, {int? page, int? limit, String? sort, bool? ama}) async {
    Map<String, String> queryParameters = {};
    if (page != null) queryParameters['page'] = page.toString();
    if (limit != null) queryParameters['limit'] = limit.toString();
    if (sort != null) queryParameters['sort'] = sort;
    if (ama != null) queryParameters['ama'] = ama ? 'true' : 'false';

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, linkId.toString(), 'comments'], queryParameters: queryParameters).request();

    return ApiOutputList<Comment>(result, Comment.fromJsonList);
  }

  Future<ApiOutput<Comment>> addComment (int linkId, String content, bool adult, [String? embedKey, String? photoKey]) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, linkId.toString(), 'comments'], method: RequestMethod.POST, bodyData: {
      'content': content,
      'embed': embedKey,
      'photo': photoKey,
      'adult': adult
    }).request();

    return ApiOutput<Comment>(result, Comment.fromJson);
  }

  Future<ApiOutput<Comment>> addSubComment (int linkId, int parentCommentId, String content, bool adult, [String? embedKey, String? photoKey]) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, linkId.toString(), 'comments', parentCommentId.toString()], method: RequestMethod.POST, bodyData: {
      'content': content,
      'embed': embedKey,
      'photo': photoKey,
      'adult': adult
    }).request();

    return ApiOutput<Comment>(result, Comment.fromJson);
  }

  Future<ApiOutput<Comment>> getComment (int linkId, int commentId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, linkId.toString(), 'comments', commentId.toString()]).request();

    return ApiOutput<Comment>(result, Comment.fromJson);
  }

  Future<ApiOutput<Comment>> editComment (int linkId, int commentId, String content, bool adult, [String? embedKey, String? photoKey]) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, linkId.toString(), 'comments', commentId.toString()], method: RequestMethod.POST, bodyData: {
      'content': content,
      'embed': embedKey,
      'photo': photoKey,
      'adult': adult
    }).request();

    return ApiOutput<Comment>(result, Comment.fromJson);
  }

  Future<ApiOutput> removeComment (int linkId, int commentId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, linkId.toString(), 'comments', commentId.toString()], method: RequestMethod.DELETE).request();

    return ApiOutput(result);
  }

  Future<ApiOutputList<Comment>> getSubComments (int linkId, int commentId, {int? page}) async {
    Map<String, String> queryParameters = {};
    if (page != null) queryParameters['page'] = page.toString();

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, linkId.toString(), 'comments', commentId.toString(), 'comments'], queryParameters: queryParameters).request();

    return ApiOutputList<Comment>(result, Comment.fromJsonList);
  }

  Future<ApiOutput> backVoteComment (int linkId, int commentId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, linkId.toString(), 'comments', commentId.toString(), 'votes'], method: RequestMethod.DELETE).request();

    return ApiOutput(result);
  }

  Future<ApiOutput> upVoteComment (int linkId, int commentId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, linkId.toString(), 'comments', commentId.toString(), 'votes', 'up'], method: RequestMethod.POST).request();

    return ApiOutput(result);
  }

  Future<ApiOutput> downVoteComment (int linkId, int commentId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, linkId.toString(), 'comments', commentId.toString(), 'votes', 'down'], method: RequestMethod.POST).request();

    return ApiOutput(result);
  }

}