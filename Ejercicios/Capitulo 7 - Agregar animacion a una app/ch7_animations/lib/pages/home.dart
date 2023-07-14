import 'package:flutter/material.dart';
import 'package:ch7_animations/widgets/animated_contained.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated container app"),
        backgroundColor: Color.fromARGB(255, 33, 189, 189),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Center(child: AnimationContainerWidget()),
            ),
          ],
        ),
      ),
    );
  }
}
