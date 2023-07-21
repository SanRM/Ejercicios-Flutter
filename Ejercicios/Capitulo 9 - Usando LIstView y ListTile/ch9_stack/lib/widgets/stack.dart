import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 20),
        Stack(
          children: [
            Image(
              image: AssetImage('assets/images/dawn.jpg'),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: CircleAvatar(
                radius: 48,
                backgroundImage: AssetImage('assets/images/leon.jpg'),
              ),
            ),
            Positioned(
              bottom: 16,
              right: 20,
              child: Text(
                'Leon',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white60,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
