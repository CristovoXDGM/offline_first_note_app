import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:offline_first_note_app/app/module/connectivity_check/ui/themes.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  late final StreamSubscription<ConnectivityResult> subscription;

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/welcome');

    return MaterialApp.router(
      title: 'Offline first app',
      theme: SimpleTheme().defaultAppTheme(),
      routerConfig: Modular.routerConfig,
    );
  }
}
