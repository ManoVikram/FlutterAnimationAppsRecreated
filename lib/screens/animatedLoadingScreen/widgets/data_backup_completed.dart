import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

import '../constants.dart';

class DataBackupCompleted extends AnimatedWidget {
  final Animation<double> endingAnimation;

  const DataBackupCompleted({
    Key? key,
    required this.endingAnimation,
  }) : super(listenable: endingAnimation);

  Animation get animation => (listenable as Animation);

  @override
  Widget build(BuildContext context) {
    return animation.value > 0
        ? Positioned.fill(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomPaint(
                        foregroundPainter:
                            DataBackupCompletedPainter(animation: animation),
                        child: Container(
                          height: 100.0,
                          width: 100.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60.0),
                  Expanded(
                    child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0.0, end: 1.0),
                      duration: const Duration(milliseconds: 500),
                      builder: (context, value, child) {
                        return Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(
                              0.0,
                              50.0 * (1 - value),
                            ),
                            child: child,
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          const Text(
                            "data has been successfully\nuploaded!",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20.0),
                          ),
                          const Spacer(),
                          OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 20.0,
                                horizontal: 40.0,
                              ),
                              child: Text(
                                "OK",
                                style: TextStyle(color: primaryDatabackupColor),
                              ),
                            ),
                          ),
                          const SizedBox(height: 40.0),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}

class DataBackupCompletedPainter extends CustomPainter {
  final Animation animation;

  DataBackupCompletedPainter({required this.animation})
      : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = primaryDatabackupColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final Path path = Path();
    path.addArc(
      Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width,
          height: size.height),
      vector.radians(-90.0),
      vector.radians(360.0 * animation.value),
    );

    final double leftLine = size.width * 0.15;
    final double rightLine = size.width * 0.35;

    final double leftLinePercent =
        animation.value > 0.5 ? 1.0 : animation.value / 0.5;
    final double rightLinePercent =
        animation.value < 0.5 ? 0.0 : (animation.value - 0.5) / 0.5;

    canvas.save();

    canvas.translate(size.width / 3, size.height / 2);

    canvas.rotate(vector.radians(-45));

    canvas.drawLine(
        Offset.zero, Offset(0.0, leftLine * leftLinePercent), paint);

    canvas.drawLine(Offset(0.0, leftLine),
        Offset(rightLine * rightLinePercent, leftLine), paint);

    canvas.restore();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}