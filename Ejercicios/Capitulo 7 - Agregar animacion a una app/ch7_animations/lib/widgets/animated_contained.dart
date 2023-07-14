import 'package:flutter/material.dart';

class AnimationContainerWidget extends StatefulWidget {
  const AnimationContainerWidget({super.key});

  @override
  State<AnimationContainerWidget> createState() =>
      _AnimationContainerWidgetState();
}

class _AnimationContainerWidgetState extends State<AnimationContainerWidget> {
  final double _height = 100;
  double _width = 100;
  bool _incrementar = true;
  String? estado = "Aumentar el tamaño";

  get incrementar => this._incrementar;

  _increaseWidth() {
    setState(() {
      if (_incrementar) {
        estado = "Pulsa para aumentar el tamaño";
        _width += 50;

        if (_width >= 350) {
          _incrementar = false;
          estado = "Pulsa para disminuir el tamaño";
        }
      } else {
        estado = "Pulsa para disminuir el tamaño";
        _width -= 50;

        if (_width <= 100) {
          _incrementar = true;
          estado = "Pulsa para aumentar el tamaño";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.decelerate,
        color: _incrementar == true
            ? Color.fromARGB(255, 82, 252, 172)
            : const Color.fromARGB(255, 255, 181, 227),
        height: _height,
        width: _width,
        child: TextButton(
            style: const ButtonStyle(
              overlayColor: MaterialStatePropertyAll(Colors.transparent),
            ),
            onPressed: _increaseWidth,
            child: Text(
              '$estado',
              style: TextStyle(
                color: _incrementar == true
                    ? Color.fromARGB(255, 7, 141, 74)
                    : Color.fromARGB(255, 172, 5, 102),
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            )));
  }
}
