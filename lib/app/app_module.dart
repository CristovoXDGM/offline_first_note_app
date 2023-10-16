import 'package:flutter_modular/flutter_modular.dart';
import 'package:offline_first_note_app/app/module/connectivity_check/data/datasources/local_db_datasource.dart';
import 'package:offline_first_note_app/app/module/connectivity_check/data/datasources/network_db_datasource.dart';
import 'package:offline_first_note_app/app/module/connectivity_check/data/repositories/get_todo_list_repository.dart';
import 'package:offline_first_note_app/app/module/connectivity_check/ui/pages/home_page.dart';
import 'package:offline_first_note_app/app/module/connectivity_check/ui/pages/welcome_page.dart';
import 'package:offline_first_note_app/app/module/connectivity_check/ui/stores/home_page_store.dart';
import 'package:uno/uno.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i
      ..add<ILocalToDosDataSource>(LocalToDosDataSource.new)
      ..add<INetworkToDosDataSource>(NetworkToDosDataSource.new)
      ..add<IGetTodoListRepository>(GetTodoListRepository.new)
      ..add(Uno.new)
      ..add(HomePageStore.new);
  }

  @override
  void routes(RouteManager r) {
    r
      ..child('/', child: (context) => const HomePage())
      ..child('/welcome', child: (context) => const WelcomePage());
  }
}
