import 'package:ch8_navigator/pages/about.dart';
import 'package:ch8_navigator/pages/gratitude.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  String? _howAreYou;

  void _openPageAbout({required BuildContext context, bool fullscreenDialog = false}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => About(),
      )
    );
  }

  void _openPageGratitude({required BuildContext context}) async {
    final _gratitudeResponse = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Gratitude(radioGroupValue: -1),
      ),
    );

    setState(() {
      print("Opción: $_gratitudeResponse");
      _howAreYou = _gratitudeResponse == null ? null : '$_gratitudeResponse';
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openPageGratitude(context: context),
        tooltip: 'About',
        child: const Icon(Icons.sentiment_satisfied),
      ),
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => _openPageAbout(
              context: context,
              fullscreenDialog: true,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: _howAreYou == null 
                ? Text("Gracias a: ... ", style: const TextStyle(fontSize: 32, color: Colors.amber)) 
                : Text("Gracias a: $_howAreYou", style: const TextStyle(fontSize: 32, color: Color.fromARGB(255, 79, 200, 221))),  
              ),
          ],
        ),
      ),
    );
  }
}
