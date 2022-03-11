import 'package:flutter/material.dart';

import './models/coffee.dart';

class CoffeeDetails extends StatelessWidget {
  final Coffee coffee;

  const CoffeeDetails({
    Key? key,
    required this.coffee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _size.width * 0.2),
            child: Hero(
              tag: "text_${coffee.name}",
              child: Material(
                child: Text(
                  coffee.name,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: _size.height * 0.4,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Hero(
                    tag: coffee.image,
                    child: Image.asset(
                      coffee.image,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Positioned(
                  left: _size.width * 0.05,
                  bottom: 0,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: 1.0, end: 0.0),
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      "₹${coffee.price.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        shadows: [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 10,
                            spreadRadius: 20,
                          ),
                        ],
                      ),
                    ),
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(-100 * value, 240 * value),
                        child: child,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
