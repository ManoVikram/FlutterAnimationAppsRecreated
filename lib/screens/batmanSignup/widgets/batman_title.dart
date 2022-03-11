import 'dart:developer';

import 'package:flutter/material.dart';

class BatmanTitle extends AnimatedWidget {
  final Animation logoTranslateAnimation;

  const BatmanTitle({
    Key? key,
    required this.logoTranslateAnimation,
  }) : super(key: key, listenable: logoTranslateAnimation);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: logoTranslateAnimation.value,
      child: Column(
        children: const [
          Text(
            "WELCOME TO",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
            ),
          ),
          Text(
            "GOTHAM CITY",
            style: TextStyle(
              color: Colors.white,
              fontSize: 36.0,
            ),
          ),
        ],
      ),
    );
  }
}
