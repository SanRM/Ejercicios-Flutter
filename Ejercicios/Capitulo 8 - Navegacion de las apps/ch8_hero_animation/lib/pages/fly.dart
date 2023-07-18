import 'package:flutter/material.dart';

class Fly extends StatelessWidget {
  const Fly({super.key});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.shortestSide / 2;

    return Scaffold(
      appBar: AppBar(
        title: Text('Fly page'),
      ),
      body: SafeArea(
        child: Hero(
        tag: 'format_paint',
        child: Container(
          alignment: Alignment.topLeft,
          child: Icon(
            Icons.format_paint,
            color: Color.fromARGB(255, 255, 101, 147),
            size: _width,
          ),
        ),
      )),
    );
  }
}
