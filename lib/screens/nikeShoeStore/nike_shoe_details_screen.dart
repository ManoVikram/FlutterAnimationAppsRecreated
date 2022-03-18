import 'package:flutter/material.dart';
import 'package:learning_flutter_animations/screens/nikeShoeStore/nike_shoe_cart_screen.dart';

import './models/nike_shoe.dart';
import './widgets/nike_shoe_carousel.dart';

class NikeShoeDetailsScreen extends StatelessWidget {
  final NikeShoe shoe;

  NikeShoeDetailsScreen({
    Key? key,
    required this.shoe,
  }) : super(key: key);

  final ValueNotifier<bool> isFABVisible = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      isFABVisible.value = true;
    });

    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset(
          "lib/screens/nikeShoeStore/assets/nike_logo.png",
          height: 40.0,
        ),
        centerTitle: true,
        leading: const BackButton(color: Colors.black),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                NikeShoeCarousel(size: _size, shoe: shoe),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: SlidingTransition(
                              child: Text(
                                shoe.modelName,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SlidingTransition(
                              child: Column(
                                children: [
                                  Text(
                                    "₹${shoe.oldPrice.toInt()}",
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 16.0,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  Text(
                                    "₹${shoe.newPrice.toInt()}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      const SlidingTransition(
                        isFromLeft: true,
                        offsetValue: 15,
                        child: Text(
                          "AVAILABLE SIZES",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      SlidingTransition(
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(right: 30.0),
                              child: Text(
                                "UK 7",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 30.0),
                              child: Text(
                                "UK 8",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 30.0),
                              child: Text(
                                "UK 9",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 30.0),
                              child: Text(
                                "UK 10",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      const SlidingTransition(
                        isFromLeft: true,
                        offsetValue: 15,
                        child: Text(
                          "DESCRIPTION",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: isFABVisible,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    heroTag: "01_FAB",
                    onPressed: () {},
                    backgroundColor: Colors.white,
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.black,
                    ),
                  ),
                  FloatingActionButton(
                    heroTag: "02_FAB",
                    onPressed: () async {
                      isFABVisible.value = false;

                      await Navigator.push(
                        context,
                        PageRouteBuilder(
                          opaque: false,
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return FadeTransition(
                              opacity: animation,
                              child: NikeShoeCartScreen(shoe: shoe),
                            );
                          },
                        ),
                      );

                      isFABVisible.value = true;
                    },
                    backgroundColor: Colors.black,
                    child: const Icon(Icons.shopping_bag_outlined),
                  ),
                ],
              ),
            ),
            builder: (context, value, child) {
              return AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                left: 0,
                right: 0,
                bottom: value ? 0 : -kToolbarHeight - 20,
                child: child!,
              );
            },
          ),
        ],
      ),
    );
  }
}



class SlidingTransition extends StatelessWidget {
  final bool isFromLeft;
  final double offsetValue;
  final Widget child;

  const SlidingTransition({
    Key? key,
    this.isFromLeft = false,
    this.offsetValue = 100.0,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 1.0, end: 0.0),
      duration: const Duration(milliseconds: 500),
      builder: (BuildContext context, double value, Widget? child) {
        print(-value * offsetValue);
        return Transform.translate(
          offset: isFromLeft
              ? Offset(-value * offsetValue, 0)
              : Offset(value * offsetValue, 0),
          child: this.child,
        );
      },
    );
  }
}
