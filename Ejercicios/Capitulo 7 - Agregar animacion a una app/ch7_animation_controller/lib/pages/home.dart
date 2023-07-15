import 'package:flutter/material.dart';
import 'package:c7_animation_controller/widgets/animated_balloon.dart';

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
        title: Text('AnimationController'),
        backgroundColor: Color.fromARGB(255, 101, 198, 255),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              AnimatedBalloonWidget()
            ],
          ),
        ),
      ),
    );
  }
}