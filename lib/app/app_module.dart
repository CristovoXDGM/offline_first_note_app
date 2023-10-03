import 'package:flutter_modular/flutter_modular.dart';
import 'package:offline_first_note_app/app/module/connectivity_check/ui/pages/home_page.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.child('name', child: (context) => const HomePage());
  }
}
