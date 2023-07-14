import 'package:flutter/material.dart';
import 'package:ch7_animations/widgets/animated_contained.dart';
import 'package:ch7_animations/widgets/animated_cross_fade.dart';

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
        title: const Text("Animated container app"),
        backgroundColor: const Color.fromARGB(255, 33, 189, 189),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(35.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimationContainerWidget(),
                Divider(),
                AnimatedCrossFadeWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
