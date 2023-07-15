import 'package:flutter/material.dart';

class AnimatedBalloonWidget extends StatefulWidget {
  const AnimatedBalloonWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedBalloonWidget> createState() => _AnimatedBalloonWidgetState();
}

class _AnimatedBalloonWidgetState extends State<AnimatedBalloonWidget>
    with TickerProviderStateMixin {
  late AnimationController _controllerFloatUp;
  late AnimationController _controllerGrowSize;
  late Animation<double> _animationFloatUp;
  late Animation<double> _animationGrowSize;

  @override
  void initState() {
    super.initState();

    _controllerFloatUp = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    );
    _animationFloatUp = Tween(begin: 0.0, end: -200.0).animate(_controllerFloatUp);

    _controllerGrowSize = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    _animationGrowSize = Tween(begin: 100.0, end: 300.0).animate(_controllerGrowSize);
  }

  @override
  void dispose() {
    _controllerFloatUp.dispose();
    _controllerGrowSize.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _balloonHeight = MediaQuery.of(context).size.height / 2;
    double _balloonWidth = MediaQuery.of(context).size.width / 3;

    return AnimatedBuilder(
      animation: _controllerFloatUp,
      builder: (context, child) {
        double marginValue = _animationFloatUp.value.clamp(0.0, double.infinity);
        return Container(
          child: child,
          margin: EdgeInsets.only(top: marginValue),
          width: _animationGrowSize.value,
        );
      },
      child: GestureDetector(
        onTap: () {
          if (_controllerFloatUp.isCompleted) {
            _controllerFloatUp.reverse();
            _controllerGrowSize.reverse();
          } else {
            _controllerFloatUp.forward();
            _controllerGrowSize.forward();
          }
        },
        child: Image.asset(
          'assets/images/BeginningGoogleFlutter-Balloon.png',
          height: _balloonHeight,
          width: _balloonWidth,
        ),
      ),
    );
  }
}
