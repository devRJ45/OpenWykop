import 'package:flutter/material.dart';
import 'package:openwykop/screens/screens.dart';

import 'package:timeago/timeago.dart' as timeago;

void main() {
  runApp(const OpenWykop());
}

class OpenWykop extends StatelessWidget {

  const OpenWykop({super.key});

  @override
  Widget build(BuildContext context) {

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