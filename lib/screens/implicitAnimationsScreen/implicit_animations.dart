import 'dart:math';

import 'package:flutter/material.dart';

class ImplicitAnimations extends StatefulWidget {
  const ImplicitAnimations({Key? key}) : super(key: key);

  @override
  State<ImplicitAnimations> createState() => _ImplicitAnimationsState();
}

class _ImplicitAnimationsState extends State<ImplicitAnimations> {
  double _value = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              /* AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: _value * 500,
                width: _value * 500,
                color: Colors.cyan,
              ), */
              /* AnimatedRotation(
                turns: _value * 100,
                duration: const Duration(milliseconds: 500),
                child: const FlutterLogo(
                  size: 200,
                ),
              ), */
              /* AnimatedCrossFade(
                firstChild: Container(
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                ),
                secondChild: const FlutterLogo(),
                crossFadeState: _value != 1
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 500),
              ), */
              /* AnimatedPositioned(
                top: _value * 100,
                right: 0,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                ),
                duration: const Duration(
                  milliseconds: 500,
                ),
              ),
              AnimatedPositioned(
                top: _value * 200,
                left: 0,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                ),
                duration: const Duration(
                  milliseconds: 500,
                ),
              ), */
              /* AnimatedDefaultTextStyle(
                child: const Text("TheVoltz"),
                style: TextStyle(
                  fontSize: _value * 40,
                  color: Colors.black,
                ),
                curve: Curves.easeInOutBack,
                duration: const Duration(milliseconds: 500),
              ), */
              /* AnimatedAlign(
                alignment: Alignment(_value, _value),
                duration: const Duration(milliseconds: 200),
                curve: Curves.slowMiddle,
                child: const FlutterLogo(),
              ), */
              /* AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                // switchInCurve: Curves.easeInBack,
                // switchOutCurve: Curves.bounceInOut,
                transitionBuilder: (child, animation) => RotationTransition(
                  turns: animation,
                  child: child,
                ),
                child: _value == 0
                    ? Container(
                        key: UniqueKey(),
                        height: 100,
                        width: 50,
                        color: Colors.indigoAccent,
                      )
                    : Container(
                        key: UniqueKey(),
                        height: 50,
                        width: 100,
                        color: Colors.amber,
                      ),
              ), */
              /* AnimatedOpacity(
                opacity: _value,
                duration: const Duration(milliseconds: 500),
                child: const FlutterLogo(
                  size: 200,
                ),
              ), */
              AnimatedScale(
                scale: _value * 10,
                duration: const Duration(milliseconds: 500),
                child: const FlutterLogo(
                  size: 200,
                ),
              ),
              /* AnimatedSlide(
                offset: Offset(-_value * pi, -_value / pi * 2),
                duration: const Duration(milliseconds: 500),
                child: const FlutterLogo(
                  size: 200,
                ),
              ), */
              const SizedBox(height: 30),
              Slider(
                value: _value,
                onChanged: (double sliderValue) {
                  setState(() {
                    _value = sliderValue;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
