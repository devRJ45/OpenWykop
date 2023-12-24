import 'dart:io';

import 'package:openwykop/api/api_properties.dart';
import 'package:openwykop/api/api_request_response.dart';
import 'package:openwykop/api/resources/resoruces.dart';

import '../api_output.dart';
import '../api_request.dart';
import '../models/models.dart';

class MediaResource extends ApiResource {
  MediaResource (ApiProperties apiProperties) : super(apiProperties, 'media');

  Future<ApiOutput<Photo>> uploadPhoto (String type, File photoFile) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'photos', 'upload'], queryParameters: {'type': type}, method: RequestMethod.POST, files: {'file': photoFile}).request();

    return ApiOutput<Photo>(result, Photo.fromJson);
  }

  Future<ApiOutput<Photo>> uploadPhotoFromUrl (String type, String url) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'photos'], queryParameters: {'type': type}, method: RequestMethod.POST, bodyData: {
      'url': url
    }).request();

    return ApiOutput<Photo>(result, Photo.fromJson);
  }

  Future<ApiOutput> removePhoto (String photoKey) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'photos', photoKey], method: RequestMethod.DELETE).request();

    return ApiOutput(result);
  }

  Future<ApiOutput<Embed>> sendEmbed (String url) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'embed'], method: RequestMethod.POST, bodyData: {
      'url': url
    }).request();

    return ApiOutput<Embed>(result, Embed.fromJson);
  }

}

