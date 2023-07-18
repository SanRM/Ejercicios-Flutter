import 'package:flutter/material.dart';
import 'package:ch8_bottom_app_bar/pages/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Home()
    );
  }
}