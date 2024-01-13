import 'package:flutter/material.dart';
import 'package:openwykop/api/api_output_list.dart';
import 'package:openwykop/api/models/models.dart' as api_models;
import 'package:openwykop/services/api.dart';

class WykopColorsService {
  static final WykopColorsService _instance = WykopColorsService._internal();

  List<api_models.Color?> colors = [];

  factory WykopColorsService () {
    return _instance;
  }

  void setColors (List<api_models.Color> newColors) {
    colors = newColors;
  }

  void fetchColors () async {
    ApiOutputList<api_models.Color> apiColorsOutput = await ApiService.api.config.getColors();

    if (apiColorsOutput.data == null) {
      colors = [];
    }

    colors = apiColorsOutput.data!;
  }

  Color getUserColor(String userColor, [bool darkColor = false]) {
    api_models.Color? apiColor = colors.firstWhere((element) => element?.name == userColor, orElse: () => null);

    if (apiColor == null) {
      return Colors.black;
    }

    if (darkColor) {
      return Color(int.parse('ff${apiColor.hexDark ?? '000000'}', radix: 16));
    }

    return Color(int.parse('ff${apiColor.hex ?? '000000'}', radix: 16));
  }

  WykopColorsService._internal();
}
