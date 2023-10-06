import 'package:flutter/material.dart';
import 'package:offline_first_note_app/app/module/connectivity_check/data/repositories/get_todo_list_repository.dart';

import '../components/custom_app_bar.dart';
import '../components/todo_list_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final IGetTodoListRepository getTodoListRepository;

  @override
  void initState() {
    super.initState();
    getTodoListRepository = GetTodoListRepository();

    getTodoListRepository();
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
            const Text(
              'Tasks list',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: TodoListCard(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: const Text('Teste'),
                      leading: Checkbox.adaptive(
                        value: true,
                        onChanged: (onChanged) {},
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
