import 'package:flutter/material.dart';

class ShakeTransition extends StatelessWidget {
  final Duration duration;
  final double offset;
  final Axis axis;
  final bool left;
  final Widget child;

  const ShakeTransition({
    Key? key,
    this.duration = const Duration(milliseconds: 700),
    this.offset = 140.0,
    this.axis = Axis.horizontal,
    this.left = true,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 1.0, end: 0.0),
      duration: duration,
      curve: Curves.ease,
      builder: (BuildContext context, double value, Widget? child) {
        return Transform.translate(
          offset: left
              ? Offset(-value * offset, value * offset)
              : Offset(value * offset, -value * offset),
          child: this.child,
        );
      },
    );
  }
}
