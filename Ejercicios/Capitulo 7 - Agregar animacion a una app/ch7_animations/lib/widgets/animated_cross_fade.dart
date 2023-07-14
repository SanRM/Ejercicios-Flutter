import 'package:flutter/material.dart';

class AnimatedCrossFadeWidget extends StatefulWidget {
  const AnimatedCrossFadeWidget({super.key});

  @override
  State<AnimatedCrossFadeWidget> createState() =>
      _AnimatedCrossFadeWidgetState();
}

class _AnimatedCrossFadeWidgetState extends State<AnimatedCrossFadeWidget> {
  bool _crossFadeStateShowFirst = true;

  _crossFade() {
    setState(() {
      _crossFadeStateShowFirst = _crossFadeStateShowFirst ? false : true;
    });
  }

  Color _seleccionarColorBloque() {
    return _crossFadeStateShowFirst
        ? Color.fromARGB(255, 183, 212, 255)
        : Color.fromARGB(255, 209, 159, 255);
  }

  Color _seleccionarColorTexto() {
    return _crossFadeStateShowFirst
        ? Color.fromARGB(255, 0, 49, 122)
        : Color.fromARGB(255, 57, 0, 110);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: Duration(milliseconds: 200),
      sizeCurve: Curves.decelerate,
      crossFadeState: _crossFadeStateShowFirst
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      firstChild: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: _crossFade,
          child: Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.center,
            color: _seleccionarColorBloque(),
            height: 100,
            width: 100,
            child:
                Text('Pulsa para aumentar el tamaño', style: TextStyle(color: _seleccionarColorTexto()), textAlign: TextAlign.center),
          ),
        ),
      ),
      secondChild: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: _crossFade,
          child: Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.center,
            color: _seleccionarColorBloque(),
            height: 150,
            width: 150,
            child: Text('Pulsa para disminuir el tamaño',
                style: TextStyle(color: _seleccionarColorTexto()),
                textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
