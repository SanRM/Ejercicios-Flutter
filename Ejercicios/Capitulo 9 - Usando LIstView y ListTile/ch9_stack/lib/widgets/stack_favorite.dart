import 'package:flutter/material.dart';

class StackFavoriteWidget extends StatelessWidget {
  const StackFavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Stack(
          children: [
            Image(image: AssetImage('assets/images/landscape.jpg')),
            Positioned(
              child: FractionalTranslation(
                translation: Offset(-0.3, -0.3),
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: Color.fromARGB(77, 209, 209, 209),
                  child: Icon(
                    Icons.star,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: CircleAvatar(
                radius: 48,
                backgroundImage: AssetImage('assets/images/eagle.jpg'),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              child: Text(
                'Bald Eagle',
                style: TextStyle(
                    fontSize: 32,
                    color: Color.fromARGB(160, 0, 0, 0),
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
