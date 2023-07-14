import 'package:flutter/material.dart';

class AnimatedOpacityWidget extends StatefulWidget {
  const AnimatedOpacityWidget({super.key});

  @override
  State<AnimatedOpacityWidget> createState() => AnimatedOpacityWidgetState();
}

class AnimatedOpacityWidgetState extends State<AnimatedOpacityWidget> {
  double _opacity = 1;

  _animatedOpacity() {
    setState(() {
      _opacity = _opacity == 1 ? 0.2 : 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: _opacity,
        child: InkWell(
          onTap: _animatedOpacity,
          child: Container(
            alignment: Alignment.center,
            color: Color.fromARGB(255, 255, 230, 87),
            height: 100,
            width: 100,
            child: const Text('Pulsa para desvanecer', textAlign: TextAlign.center, style: TextStyle(color: Color.fromARGB(255, 150, 112, 0)),),
          ),
        ),
      ),
    );
  }
}
