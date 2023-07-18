import 'package:flutter/material.dart';
import 'package:ch8_hero_animation/pages/fly.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('Hero animation'),),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: InkWell(
            onTap: () => Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => const Fly())
              ),
            child: const Hero(
              tag: 'format_paint',
              child: Icon(Icons.format_paint, color: Color.fromARGB(255, 33, 128, 151), size: 120,),
            ),
          ),
        ),
      ),
    );
  }
}