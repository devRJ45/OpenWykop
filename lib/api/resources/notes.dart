import 'package:openwykop/api/api_output.dart';
import 'package:openwykop/api/api_properties.dart';
import 'package:openwykop/api/api_request_response.dart';
import 'package:openwykop/api/resources/resoruces.dart';

import '../api_request.dart';
import '../models/models.dart';

class NotesResource extends ApiResource {
  NotesResource (ApiProperties apiProperties) : super(apiProperties, 'notes');

  Future<ApiOutput<Note>> getNote (String username) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, username]).request();

    return ApiOutput<Note>(result, Note.fromJson);
  }

  Future<ApiOutput> setNote (String username, String content) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, username], method: RequestMethod.PUT, bodyData: {
      'content': content,
    }).request();

    return ApiOutput(result);
  }

}