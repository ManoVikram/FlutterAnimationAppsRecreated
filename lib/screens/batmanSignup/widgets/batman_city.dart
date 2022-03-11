import 'package:flutter/material.dart';

class BatmanCity extends AnimatedWidget {
  final Animation animation;

  const BatmanCity({
    Key? key,
    required this.animation,
  }) : super(key: key, listenable: animation);

  Animation get _cityAnimation => listenable as Animation;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CityClipper(progress: _cityAnimation.value),
      child: Image.asset(
        "lib/screens/batmanSignup/assets/city.png",
        fit: BoxFit.contain,
      ),
    );
  }
}

class CityClipper extends CustomClipper<Path> {
  final double progress;

  CityClipper({required this.progress});

  @override
  getClip(Size size) {
    final Path path = Path();

    path.moveTo(0.0, size.height);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width / 2, size.height * (1 - progress));
    path.lineTo(0.0, size.height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;
}
