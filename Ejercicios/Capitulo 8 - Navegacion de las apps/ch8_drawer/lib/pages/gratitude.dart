import 'package:flutter/material.dart';

class Gratitude extends StatelessWidget {
  const Gratitude({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bithday'),
      ),
      body: const Center(
        child: Icon(
          Icons.sentiment_satisfied,
          size: 120,
          color: Color.fromARGB(255, 127, 225, 255),
        ),
      ),
    );
  }
}