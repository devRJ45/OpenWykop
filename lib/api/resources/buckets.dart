import 'package:openwykop/api/api_properties.dart';
import 'package:openwykop/api/api_request_response.dart';
import 'package:openwykop/api/resources/resoruces.dart';

import '../api_output.dart';
import '../api_output_list.dart';
import '../api_request.dart';
import '../models/models.dart';

class BucketsResource extends ApiResource {
  BucketsResource (ApiProperties apiProperties) : super(apiProperties, 'buckets');

  Future<ApiOutput<Bucket>> createBucket (String title, String? query, String defaultPage) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath], method: RequestMethod.POST, bodyData: {
      'title': title,
      'query': query,
      'default_page': defaultPage
    }).request();

    return ApiOutput<Bucket>(result, Bucket.fromJson);
  }

  Future<ApiOutputList<Bucket>> getAll () async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath]).request();

    return ApiOutputList<Bucket>(result, Bucket.fromJsonList);
  }

  Future<ApiOutput<Bucket>> editBucket (String bucketHash, String title, String? query, String defaultPage) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, bucketHash], method: RequestMethod.PUT, bodyData: {
      'title': title,
      'query': query,
      'default_page': defaultPage
    }).request();

    return ApiOutput<Bucket>(result, Bucket.fromJson);
  }

  Future<ApiOutput> removeBucket (String bucketHash) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, bucketHash], method: RequestMethod.DELETE).request();

    return ApiOutput(result);
  }

  Future<ApiOutput<BucketSearchOutput>> searchInBucket (String query) async { // always return "{count: null, items: null}". Missing bucket argument?
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'search'], queryParameters: {'query': query}).request();

    return ApiOutput<BucketSearchOutput>(result, BucketSearchOutput.fromJson);
  }

  Future<ApiOutputList<BucketStatus>> getBucketsStatus () async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'status']).request();

    return ApiOutputList<BucketStatus>(result, BucketStatus.fromJsonList);
  }

  Future<ApiOutputList<StreamItem>> getBucketStream (String bucketHash, [String? page]) async {
    Map<String, String> queryParameters = {};
    if (page != null) queryParameters['page'] = page;
    
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'stream', bucketHash], queryParameters: queryParameters).request();

    return ApiOutputList<StreamItem>(result);
  }

}