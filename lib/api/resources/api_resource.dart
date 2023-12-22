import 'package:openwykop/api/api_properties.dart';

abstract class ApiResource {

  final ApiProperties apiProperties;
  final String resourcePath;

  ApiResource(ApiProperties? apiProperties, this.resourcePath) : apiProperties = apiProperties ?? ApiProperties();
}