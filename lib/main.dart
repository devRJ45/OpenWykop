import 'dart:async';

import 'package:flutter/material.dart';
import 'package:openwykop/screens/screens.dart';
import 'package:openwykop/services/api.dart';
import 'package:openwykop/services/preferences.dart';

import 'package:timeago/timeago.dart' as timeago;
import 'package:uni_links/uni_links.dart';

void main() {
  runApp(OpenWykop());
}

class OpenWykop extends StatelessWidget {

  OpenWykop({super.key});

  late StreamSubscription _sub;

  Future<void> initUniLinks() async {
    _sub = linkStream.listen((String? link) {
      if (link?.indexOf('openwykop://connect') == 0) {
        List linkSegments = link!.split('?').last.split('&').map((e) => e.split('=')).toList();
        
        String token = linkSegments.firstWhere((element) => element[0] == 'token')[1];
        String refreshToken = linkSegments.firstWhere((element) => element[0] == 'rtoken')[1];

        PreferencesService().setApiProperty('token', token);
        PreferencesService().setApiProperty('refresh_token', refreshToken);

        ApiService.setToken(token, refreshToken);
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    initUniLinks();

    timeago.setLocaleMessages('pl', timeago.PlMessages());

    return MaterialApp(
      title: 'OpenWykop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff4383af), brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: const LoadingScreen(),
    );
  }
}