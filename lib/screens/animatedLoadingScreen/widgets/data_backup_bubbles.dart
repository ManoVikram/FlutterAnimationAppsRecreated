import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../constants.dart';

import '../models/bubble.dart';

class DataBackupBubbles extends StatelessWidget {
  final Animation<double> progressAnimation;
  final Animation<double> bubbleAnimation;
  final Animation<double> bubbleCloudAnimation;

  const DataBackupBubbles({
    Key? key,
    required this.progressAnimation,
    required this.bubbleAnimation,
    required this.bubbleCloudAnimation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final List<Bubble> bubbles = List<Bubble>.generate(
      500,
      (index) {
        final double size = math.Random().nextInt(20) + 5.0;
        final double speed = math.Random().nextInt(50) + 1.0;
        final bool isDirectionRandom = math.Random().nextBool();
        final bool isColorRandom = math.Random().nextBool();
        final double direction =
            math.Random().nextInt(250) * (isDirectionRandom ? 1.0 : -1.0);
        final Color color =
            isColorRandom ? primaryDatabackupColor : secondaryDatabackupColor;

        return Bubble(
          color: color,
          direction: direction,
          speed: speed,
          size: size,
          initialPosition: index * 10.0,
        );
      },
    );

    return AnimatedBuilder(
        animation: Listenable.merge([progressAnimation, bubbleAnimation]),
        builder: (context, child) {
          final double bubbleSize = size.width * 0.5;
          final double animatedBubbleSize = bubbleSize *
              math.pow(progressAnimation.value + 1 + bubbleAnimation.value, 2);
          final double topPosition = size.height * 0.45;
          final double leftBubbleSize =
              bubbleSize * 0.6 * (1 - progressAnimation.value);
          final double rightBubbleSize =
              bubbleSize * 0.7 * (1 - progressAnimation.value);
          final double centerMargin = size.width - animatedBubbleSize;
          final double leftMargin = size.width / 2 - leftBubbleSize * 1.2;
          final double rightMargin = size.width / 2 - rightBubbleSize * 1.2;
          final double middleMargin =
              size.width / 2 - (bubbleSize / 2) * (1 - progressAnimation.value);
          final double topBubblePosition = size.height * bubbleAnimation.value;

          return Positioned(
            top: topPosition - animatedBubbleSize + topBubblePosition,
            left: 0,
            right: 0,
            height: animatedBubbleSize,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: middleMargin,
                  height: leftBubbleSize / 2,
                  width: bubbleSize * (1 - progressAnimation.value),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: leftMargin,
                  height: leftBubbleSize,
                  width: leftBubbleSize,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: rightMargin,
                  height: rightBubbleSize,
                  width: rightBubbleSize,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: centerMargin / 2,
                  height: animatedBubbleSize,
                  width: animatedBubbleSize,
                  child: ClipOval(
                    child: CustomPaint(
                      foregroundPainter: _BubblePainter(
                        animation: bubbleCloudAnimation,
                        bubbles: bubbles,
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class _BubblePainter extends CustomPainter {
  final Animation animation;
  final List<Bubble> bubbles;

  _BubblePainter({
    required this.animation,
    required this.bubbles,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    for (Bubble bubble in bubbles) {
      final Offset offset = Offset(
        size.width / 2 + bubble.direction * animation.value,
        size.height * 1.2 * (1 - animation.value) -
            bubble.speed * animation.value +
            bubble.initialPosition * (1 - animation.value),
      );

      canvas.drawCircle(
        offset,
        bubble.size,
        Paint()..color = bubble.color,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}