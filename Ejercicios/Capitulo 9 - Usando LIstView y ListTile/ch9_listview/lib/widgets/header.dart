import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        height: 120,    
        child: const Card(
        elevation: 4,
        color: Color.fromARGB(255, 250, 237, 255),
        //shape: StadiumBorder(side: BorderSide(color: Colors.cyan)),
        shape: UnderlineInputBorder(borderSide: BorderSide(color: const Color.fromARGB(255, 197, 38, 218))),
        // shape: OutlineInputBorder(borderSide: BorderSide(color: Colors.cyan)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Barista',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 48,
                color: Color.fromARGB(255, 213, 123, 255)
              ),
            ),
            Text(
              'Travel Plans',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 215, 114, 255)
              ),
            )
          ],
        ),
      ),
    );
  }
}