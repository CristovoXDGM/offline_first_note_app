import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:offline_first_note_app/app/module/connectivity_check/ui/themes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

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
