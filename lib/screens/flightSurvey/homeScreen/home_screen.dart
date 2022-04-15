import 'package:flutter/material.dart';

import './models/question.dart';
import './widgets/option.dart';
import './widgets/question_number.dart';
import './widgets/question_text.dart';
import './widgets/dot.dart';

class FlightSurveyHomeScreen extends StatefulWidget {
  const FlightSurveyHomeScreen({Key? key}) : super(key: key);

  @override
  State<FlightSurveyHomeScreen> createState() => _FlightSurveyHomeScreenState();
}

class _FlightSurveyHomeScreenState extends State<FlightSurveyHomeScreen>
    with SingleTickerProviderStateMixin {
  late List<GlobalKey<_ItemFadeTranslaterState>> keys;

  late final AnimationController _animationController;

  int currentQuestion = 0;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    //! There are 5 differnt elements I need to animate
    //! so, I'm using 5 different keys
    keys = List.generate(
      5,
      (index) => GlobalKey<_ItemFadeTranslaterState>(),
    );

    onInit();
  }

  Future<void> onInit() async {
    for (GlobalKey<_ItemFadeTranslaterState> key in keys) {
      await Future.delayed(const Duration(milliseconds: 50));
      key.currentState?.show();
    }
  }

  Future<void> onTap() async {
    for (GlobalKey<_ItemFadeTranslaterState> key in keys) {
      await Future.delayed(const Duration(milliseconds: 50));
      key.currentState?.hide();
    }

    await Future.delayed(const Duration(milliseconds: 500));

    setState(() {
      currentQuestion++;

      if (currentQuestion > 1) {
        currentQuestion = 0;
      }

      onInit();
    });
  }

  Future<void> onTapAnimateDot(double height) async {
    _animationController.forward();

    RenderBox? object = context.findRenderObject() as RenderBox?;
    Offset? globalPosition = object?.localToGlobal(Offset.zero);

    OverlayEntry entry = OverlayEntry(
      builder: (context) {
        // double top = MediaQuery.of(context).padding.top;

        return AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Positioned(
              left: 70.0,
              top: height +
                  (globalPosition!.dy - height) * (_animationController.value),
              child: child!,
            );
          },
          child: const Dot(),
        );
      },
    );

    Overlay.of(context)?.insert(entry);
    await _animationController.forward(from: 0.0);
    entry.remove();

    onTap();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 89, 0, 255),
                Colors.purple[800]!,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              const Positioned(
                top: 20.0,
                left: 50.0,
                child: RotatedBox(
                  quarterTurns: 2,
                  child: Icon(
                    Icons.flight,
                    color: Colors.white,
                    size: 50.0,
                  ),
                ),
              ),
              Positioned(
                top: 50.0,
                left: 75.0,
                height: _size.height * 0.83,
                child: Container(
                  width: 1.2,
                  decoration: const BoxDecoration(
                    color: Colors.white54,
                  ),
                ),
              ),
              Positioned(
                bottom: 16.0,
                left: 16.0,
                child: Column(
                  children: [
                    const Icon(
                      Icons.arrow_upward,
                      size: 28.0,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.arrow_downward,
                        size: 28.0,
                        color: Colors.purple[800],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 70.0,
                child: SizedBox(
                  height: _size.height * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ItemFadeTranslater(
                        key: keys[0],
                        // child: const QuestionNumber(questionNumber: "01"),
                        child: QuestionNumber(
                            questionNumber:
                                questions[currentQuestion].questionNumber),
                      ),
                      ItemFadeTranslater(
                        key: keys[1],
                        child: QuestionText(
                          size: _size,
                          // text: "How many hours in your average flight?",
                          text: questions[currentQuestion].question,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        // width: _size.width * 0.7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20.0),
                            ItemFadeTranslater(
                              key: keys[2],
                              child: Option(
                                size: _size,
                                onTap: () async {
                                  await onTapAnimateDot(_size.height * 0.6);
                                },
                                // answer: "Less than two hours",
                                answer: questions[currentQuestion].option1,
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            ItemFadeTranslater(
                              key: keys[3],
                              child: Option(
                                size: _size,
                                onTap: () async {
                                  await onTapAnimateDot(_size.height * 0.7);
                                },
                                // answer:
                                //     "More than two but less than five hours",
                                answer: questions[currentQuestion].option2,
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            ItemFadeTranslater(
                              key: keys[4],
                              child: Option(
                                size: _size,
                                onTap: () async {
                                  await onTapAnimateDot(_size.height * 0.8);
                                },
                                // answer: "Others",
                                answer: questions[currentQuestion].option3,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 72.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemFadeTranslater extends StatefulWidget {
  const ItemFadeTranslater({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<ItemFadeTranslater> createState() => _ItemFadeTranslaterState();
}

class _ItemFadeTranslaterState extends State<ItemFadeTranslater>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  late final Animation animation;

  int position = 1;

  void show() {
    setState(() {
      position = 1;
    });
    _animationController.forward();
  }

  void hide() {
    setState(() {
      position = -1;
    });
    _animationController.reverse();
  }

  /* Future<void> animateDot(Offset startOffset) async {
    RenderBox? object = context.findRenderObject() as RenderBox?;
    Offset? globalPosition = object?.localToGlobal(Offset.zero);

    OverlayEntry entry = OverlayEntry(
      builder: (context) {
        double top = MediaQuery.of(context).padding.top;

        return AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Positioned(
              left: 70.0,
              top: top +
                  (globalPosition!.dy - top) * (1 - _animationController.value),
              child: child!,
            );
          },
          child: const Dot(),
        );
      },
    );

    Overlay.of(context)?.insert(entry);
    await _animationController.forward(from: 0.0);
    entry.remove();
  } */

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: widget.child,
      builder: (context, child) {
        // RenderBox? object = context.findRenderObject() as RenderBox?;
        // Offset? globalPosition = object?.localToGlobal(Offset.zero);
        // animateDot(globalPosition!);

        return Transform.translate(
          offset: Offset(
            0.0,
            72.0 * position * (1 - animation.value),
          ),
          child: Opacity(
            opacity: animation.value,
            child: child,
          ),
        );
      },
    );
  }
}
