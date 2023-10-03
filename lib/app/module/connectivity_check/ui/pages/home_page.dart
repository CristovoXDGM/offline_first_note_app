import 'package:flutter/material.dart';

import '../components/custom_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // const screenPercentage = 0.9;

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
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SizedBox(
                  height: size.height / 2,
                  width: size.width,
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
