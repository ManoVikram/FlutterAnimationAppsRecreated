import 'package:flutter/material.dart';

class ProgressCounter extends AnimatedWidget {
  ProgressCounter(Animation<double> animation) : super(listenable: animation);

  double get value => (listenable as Animation).value;

  @override
  Widget build(BuildContext context) {
    print(value);
    return Text(
      "${(value * 100).truncate().toString()}%",
    );
  }
}