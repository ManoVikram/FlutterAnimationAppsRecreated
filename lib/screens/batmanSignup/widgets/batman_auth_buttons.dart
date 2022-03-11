import 'package:flutter/material.dart';

import '../batman_home_screen.dart';

class BatmanAuthButtons extends AnimatedWidget {
  final Animation buttonZoomInAnimation;
  final VoidCallback onTap;

  const BatmanAuthButtons({
    Key? key,
    required this.buttonZoomInAnimation,
    required this.onTap,
  }) : super(key: key, listenable: buttonZoomInAnimation);

  Animation get _animationButtonTranslate => listenable as Animation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Opacity(
        opacity: buttonZoomInAnimation.value.clamp(0.0, 1.0),
        child: Transform.translate(
          offset: Offset(0.0, buttonZoomInAnimation.value),
          child: Column(
            children: [
              BatmanButton(
                onTap: onTap,
                text: "LOGIN",
              ),
              const SizedBox(height: 20.0),
              BatmanButton(
                onTap: onTap,
                text: "SIGNUP",
                left: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
