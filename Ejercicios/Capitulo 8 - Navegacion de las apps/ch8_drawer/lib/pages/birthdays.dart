import 'package:flutter/material.dart';

class Birthdays extends StatelessWidget {
  const Birthdays({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bithday'),
      ),
      body: Center(
          child: Icon(
        Icons.cake,
        size: 120,
        color: Color.fromRGBO(255, 227, 104, 1),
      )),
    );
  }
}
