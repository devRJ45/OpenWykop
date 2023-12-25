import 'package:openwykop/api/api_properties.dart';
import 'package:openwykop/api/api_request_response.dart';
import 'package:openwykop/api/resources/resoruces.dart';

import '../api_output.dart';
import '../api_output_bool.dart';
import '../api_output_list.dart';
import '../api_output_string.dart';
import '../api_request.dart';
import '../models/models.dart';

class PMResource extends ApiResource {
  PMResource (ApiProperties apiProperties) : super(apiProperties, 'pm');

  Future<ApiOutputString> getLastConversationUsername () async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'open']).request();

    return ApiOutputString(result);
  }

  Future<ApiOutput> setAllConversationsAsRead () async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'read-all'], method: RequestMethod.PUT).request();

    return ApiOutput(result);
  }

  Future<ApiOutputList<ConversationShort>> getConversations ({int? page, String? query}) async {
    Map<String, String> queryParameters = {};
    if (page != null) queryParameters['page'] = page.toString();
    if (query != null) queryParameters['query'] = query;

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'conversations'], queryParameters: queryParameters).request();

    return ApiOutputList<ConversationShort>(result, ConversationShort.fromJsonList);
  }

  Future<ApiOutput<ConversationMessage>> sendMessage (String username, String content, bool adult, [String? photoKey, String? embedKey]) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'conversations', username], method: RequestMethod.POST, bodyData: {
      'content': content,
      'photo': photoKey,
      'embed': embedKey,
      'adult': adult,
    }).request();

    return ApiOutput<ConversationMessage>(result, ConversationMessage.fromJson);
  }

  Future<ApiOutput<Conversation>> getConversation (String username, {String? prevMessage, String? nextMessage}) async {
    Map<String, String> queryParameters = {};
    if (prevMessage != null) queryParameters['prev_message'] = prevMessage;
    if (nextMessage != null) queryParameters['next_message'] = nextMessage;

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'conversations', username], queryParameters: queryParameters).request();

    return ApiOutput<Conversation>(result, Conversation.fromJson);
  }

  Future<ApiOutput> removeConversation (String username) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'conversations', username], method: RequestMethod.DELETE).request();

    return ApiOutput(result);
  }

  Future<ApiOutputBool> newerMessages (String username) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'conversations', username, 'newer']).request();

    return ApiOutputBool(result);
  }

}

