import 'package:flutter/material.dart';

class Reminders extends StatelessWidget {
  const Reminders({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.access_alarm,
          color: Color.fromARGB(255, 255, 123, 162),
          size: 120,
        ),
      ),
    );
  }
}