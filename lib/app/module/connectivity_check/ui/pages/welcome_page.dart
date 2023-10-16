import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.7,
              height: 250,
              child: const Placeholder(),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Get things To Do',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "ToDo app is a task management app,\n to help you stay organize and\nmanage you day-to-day",
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              width: size.width * 0.8,
              child: ElevatedButton(
                onPressed: () {
                  Modular.to.pushReplacementNamed('/');
                },
                child: const Text(
                  'Get started',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
