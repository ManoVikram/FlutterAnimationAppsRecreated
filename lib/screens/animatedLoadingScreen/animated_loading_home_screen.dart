import 'package:flutter/material.dart';
import 'dart:math' as math;

import './constants.dart';

enum DataBackupState {
  initial,
  start,
  end,
}

class AnimatedLoadingHomeScreen extends StatefulWidget {
  const AnimatedLoadingHomeScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedLoadingHomeScreen> createState() =>
      _AnimatedLoadingHomeScreenState();
}

class _AnimatedLoadingHomeScreenState extends State<AnimatedLoadingHomeScreen>
    with SingleTickerProviderStateMixin {
  DataBackupState _currentBackupState = DataBackupState.initial;

  late final AnimationController _animationController;

  late final Animation<double> _progressAnimation;
  late final Animation<double> _bubbleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 7000),
    );

    _progressAnimation = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.65),
    );

    _bubbleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.7, 0.85),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Expanded(
                    flex: 3,
                    child: Text(
                      "Cloud Storage",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                  if (_currentBackupState == DataBackupState.end)
                    Expanded(
                      child: TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0.0, end: 1.0),
                        duration: const Duration(milliseconds: 500),
                        builder: (context, value, child) {
                          return Opacity(
                            opacity: value,
                            child: child,
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              "Uploading files",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Expanded(
                              child: FittedBox(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ProgressCounter(_progressAnimation),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (_currentBackupState != DataBackupState.end)
                    Expanded(
                      flex: 1,
                      child: TweenAnimationBuilder<double>(
                        duration: const Duration(milliseconds: 500),
                        tween: Tween(
                          begin: 1.0,
                          end: _currentBackupState != DataBackupState.initial
                              ? 0.0
                              : 1.0,
                        ),
                        onEnd: () {
                          setState(() {
                            _currentBackupState = DataBackupState.end;
                          });
                        },
                        builder: (context, value, child) {
                          return Opacity(
                            opacity: value,
                            child: Transform.translate(
                              offset: Offset(0.0, -50 * value),
                              child: child,
                            ),
                          );
                        },
                        child: Column(
                          children: const [
                            Text("last backup:"),
                            SizedBox(height: 10.0),
                            Text(
                              "14 March 2022",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: SizedBox(
                        width: double.infinity,
                        child: _currentBackupState == DataBackupState.initial
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: primaryDatabackupColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _currentBackupState = DataBackupState.start;
                                  });

                                  _animationController.forward();
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    "Create Backup",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            : OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    _currentBackupState =
                                        DataBackupState.initial;
                                  });
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 20.0,
                                    horizontal: 40.0,
                                  ),
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(),
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                ],
              ),
            ),
          ),
          DataBackupBubbles(
            progressAnimation: _progressAnimation,
            bubbleAnimation: _bubbleAnimation,
          ),
        ],
      ),
    );
  }
}

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

class DataBackupBubbles extends StatelessWidget {
  final Animation<double> progressAnimation;
  final Animation<double> bubbleAnimation;

  const DataBackupBubbles({
    Key? key,
    required this.progressAnimation,
    required this.bubbleAnimation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return AnimatedBuilder(
        animation: Listenable.merge([progressAnimation, bubbleAnimation]),
        builder: (context, child) {
          final double bubbleSize = size.width * 0.5;
          final double animatedBubbleSize =
              bubbleSize * math.pow(progressAnimation.value + 1 + bubbleAnimation.value, 2);
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

          return Positioned(
            top: topPosition - animatedBubbleSize,
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
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
