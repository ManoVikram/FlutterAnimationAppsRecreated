import 'package:flutter/material.dart';

import './models/nike_shoe.dart';
import './widgets/bottom_panel.dart';

class NikeShoeCartScreen extends StatefulWidget {
  final NikeShoe shoe;

  const NikeShoeCartScreen({
    Key? key,
    required this.shoe,
  }) : super(key: key);

  @override
  State<NikeShoeCartScreen> createState() => _NikeShoeCartScreenState();
}

class _NikeShoeCartScreenState extends State<NikeShoeCartScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation sizeAnimation;
  late final Animation inMovementAnimation;
  late final Animation outMovementAnimation;

  double _buttonWidth = 200.0;
  double _circularButtonWidth = 70.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

    sizeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.3),
      ),
    );

    inMovementAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.35,
          0.55,
          curve: Curves.easeInQuint,
        ),
      ),
    );

    outMovementAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.6,
          1.0,
          curve: Curves.elasticIn,
        ),
      ),
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context, true);
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Material(
      color: Colors.transparent,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    color: Colors.black87,
                  ),
                ),
              ),
              Positioned.fill(
                child: Stack(
                  children: [
                    // if (inMovementAnimation.value != 1.0)
                    Positioned(
                      // bottom: 0.0,
                      top: _size.height * 0.4 +
                          (inMovementAnimation.value * _size.height * 0.455),
                      left: _size.width / 2 -
                          (_size.width * sizeAnimation.value)
                                  .clamp(_circularButtonWidth, _size.width) /
                              2,
                      width: (_size.width * sizeAnimation.value)
                          .clamp(_circularButtonWidth, _size.width),
                      child: inMovementAnimation.value != 1.0
                          ? BottomPanel(
                              size: _size,
                              widget: widget,
                              sizeAnimation: sizeAnimation,
                              buttonWidth: _buttonWidth,
                              circularButtonWidth: _circularButtonWidth,
                            )
                          : const SizedBox.shrink(),
                    ),
                    Positioned(
                      bottom: 40.0 - (outMovementAnimation.value * 120),
                      // bottom: 40.0,
                      // left: _size.width / 2 - 180 / 2,
                      left: _size.width / 2 -
                          (_buttonWidth * sizeAnimation.value)
                                  .clamp(_circularButtonWidth, _buttonWidth) /
                              2,
                      child: TweenAnimationBuilder<double>(
                        tween: Tween(begin: 1.0, end: 0.0),
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        builder: (context, value, child) {
                          return Transform.translate(
                            offset: Offset(0.0, value * _size.height * 0.6),
                            child: child,
                          );
                        },
                        child: InkWell(
                          onTap: () {
                            _animationController.forward();
                          },
                          child: Container(
                            height: 70,
                            width: (_buttonWidth * sizeAnimation.value)
                                .clamp(_circularButtonWidth, _buttonWidth),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.circular(_circularButtonWidth),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.shopping_bag_outlined,
                                    color: Colors.white,
                                  ),
                                  if (sizeAnimation.value == 1.0) ...[
                                    const SizedBox(width: 10.0),
                                    const Text(
                                      "ADD TO CART",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ]
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
