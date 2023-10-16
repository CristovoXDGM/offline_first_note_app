import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:offline_first_note_app/app/module/connectivity_check/ui/stores/home_page_states.dart';
import 'package:offline_first_note_app/app/module/connectivity_check/ui/stores/home_page_store.dart';

import '../components/custom_app_bar.dart';
import '../components/todo_list_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomePageStore store;
  late final StreamSubscription<ConnectivityResult> subscription;
  final isConnected = ValueNotifier<bool>(false);

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    store = context.read<HomePageStore>();

    store.getAllTodos();
    subscription =
        Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        isConnected.value = false;
        store.getAllTodos();
      } else {
        isConnected.value = true;
        store.getAllTodos();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            ValueListenableBuilder<bool>(
                valueListenable: isConnected,
                builder: (context, connected, child) {
                  if (connected) {
                    return Container(
                      color: Colors.green,
                      child: const Text(
                        'Online',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                      ),
                    );
                  } else {
                    return Container(
                      color: Colors.red,
                      child: const Text(
                        'Offline',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                      ),
                    );
                  }
                }),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Tasks list',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: TodoListCard(
                child: ValueListenableBuilder(
                    valueListenable: store,
                    builder: (context, value, child) {
                      if (value is SuccessRetrieveTodosHomePageState) {
                        if (value.toDos.isEmpty) {
                          const Center(
                            child: Text('Empty list here'),
                          );
                        }

                        return ListView.builder(
                          itemCount: value.toDos.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(value.toDos[index].title),
                              leading: Checkbox.adaptive(
                                value: value.toDos[index].done,
                                onChanged: (onChanged) {},
                              ),
                            );
                          },
                        );
                      }
                      if (value is ErrorHomePageState) {
                        return Center(
                          child: Text(value.message),
                        );
                      }
                      if (value is LoadingHomePageState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return const Center(
                        child: Text('No notes here'),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
