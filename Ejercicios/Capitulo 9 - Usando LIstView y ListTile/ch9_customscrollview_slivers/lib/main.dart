import 'package:ch9_customscrollview_slivers/pages/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      title: 'Material App',
      // home: Home()
      home: Home(),
    );
  }
}