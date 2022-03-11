import 'dart:math' as math;

import 'package:flutter/material.dart';

class CustomAnimation extends StatefulWidget {
  const CustomAnimation({Key? key}) : super(key: key);

  @override
  State<CustomAnimation> createState() => _CustomAnimationState();
}

class _CustomAnimationState extends State<CustomAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  static const double maxSlide = 225.0;
  static const double minDragStartEdge = 200;
  static const double maxDragStartEdge = maxSlide - 25;

  bool _canBeDragged = false;

  double _value = 0.5;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void toggle() => _animationController.isDismissed
      ? _animationController.forward()
      : _animationController.reverse();

  // ? I don't know how the below 3 functions work
  void _onDragStart(DragStartDetails details) {
    bool isDragOpenFromLeft = _animationController.isDismissed &&
        details.globalPosition.dx < minDragStartEdge;
    bool isDragCloseFromRight = _animationController.isCompleted &&
        details.globalPosition.dx > maxDragStartEdge;

    _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      double delta = details.primaryDelta! / maxSlide;
      _animationController.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    if (_animationController.isDismissed || _animationController.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= 365.0) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;

      _animationController.fling(velocity: visualVelocity);
    } else if (_animationController.value < 0.5) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* body: Column(
        children: [
          Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.002)
              ..rotateX(_value * math.pi * 2)
              ..scale(_value),
            alignment: Alignment.center,
            child: const FlutterLogo(
              size: 200,
            ),
          ),
          Slider(
            value: _value,
            onChanged: (sliderValue) {
              setState(() {
                _value = sliderValue;
              });
            },
          ),
        ],
      ), */
      body: GestureDetector(
        onTap: toggle,
        onHorizontalDragStart: _onDragStart,
        onHorizontalDragUpdate: _onDragUpdate,
        onHorizontalDragEnd: _onDragEnd,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            // * Value of animation controller ranges from 0 to 1
            double slide = maxSlide * _animationController.value;
            double scale = 1 - (_animationController.value * 0.3);

            return Stack(
              children: [
                Container(color: Colors.blue),
                Transform(
                  transform: Matrix4.identity()
                    ..scale(scale)
                    ..translate(slide),
                  alignment: Alignment.centerLeft,
                  child: Container(color: Colors.yellow),
                ),
              ],
            );
          },
        ),
      ),
      /* body: GestureDetector(
        onTap: toggle,
        onHorizontalDragStart: _onDragStart,
        onHorizontalDragUpdate: _onDragUpdate,
        onHorizontalDragEnd: _onDragEnd,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, snapshot) {
            return Material(
              color: Colors.blueGrey,
              child: Stack(
                children: [
                  Transform.translate(
                    offset:
                        Offset(maxSlide * (_animationController.value - 1), 0),
                    child: Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(
                            math.pi / 2 * (1 - _animationController.value)),
                      alignment: Alignment.centerRight,
                      child: Container(
                        color: Colors.blue,
                        width: MediaQuery.of(context).size.width * 0.57 + 2,
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(maxSlide * _animationController.value, 0),
                    child: Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(-math.pi * _animationController.value / 2),
                      alignment: Alignment.centerLeft,
                      child: Container(color: Colors.yellow),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ), */
    );
  }
}
