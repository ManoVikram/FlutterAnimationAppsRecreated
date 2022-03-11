import 'package:flutter/material.dart';

import '../nike_shoe_cart_screen.dart';

class BottomPanel extends StatelessWidget {
  const BottomPanel({
    Key? key,
    required Size size,
    required this.buttonWidth,
    required this.circularButtonWidth,
    required this.sizeAnimation,
    required this.widget,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final double buttonWidth;
  final double circularButtonWidth;
  final Animation sizeAnimation;
  final NikeShoeCartScreen widget;

  final double _fullImageSize = 200.0;
  final double _minimizedImageSize = 50.0;

  @override
  Widget build(BuildContext context) {
    final currentImageSize = (_fullImageSize * sizeAnimation.value)
        .clamp(_minimizedImageSize, _fullImageSize);

    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 500),
      tween: Tween(begin: 1.0, end: 0.0),
      curve: Curves.fastLinearToSlowEaseIn,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0.0, value * _size.height * 0.6),
          child: child,
        );
      },
      child: Container(
        height: (_size.height * 0.6 * sizeAnimation.value)
            .clamp(circularButtonWidth, _size.height * 0.6),
        width: (_size.width * sizeAnimation.value)
            .clamp(circularButtonWidth, _size.width),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: sizeAnimation.value == 1.0
                ? const Radius.circular(30.0)
                : const Radius.circular(70.0),
            bottom: sizeAnimation.value == 1.0
                ? Radius.zero
                : const Radius.circular(70.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Image.asset(
                      widget.shoe.images.first,
                      // height: currentImageSize,
                    ),
                  ),
                  if (sizeAnimation.value == 1.0)
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            widget.shoe.modelName,
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            "₹${widget.shoe.newPrice.toInt().toString()}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}