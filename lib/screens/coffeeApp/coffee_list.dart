import 'package:flutter/material.dart';
import 'package:learning_flutter_animations/screens/coffeeApp/coffee_details.dart';

import './models/coffee.dart';

const double _initialPage = 8.0;

class CoffeeList extends StatefulWidget {
  const CoffeeList({Key? key}) : super(key: key);

  @override
  State<CoffeeList> createState() => _CoffeeListState();
}

class _CoffeeListState extends State<CoffeeList> {
  late PageController _coffeePageController;
  late PageController _coffeeNamePageController;

  double _coffeePage = _initialPage;
  double _textPage = _initialPage;

  @override
  void initState() {
    super.initState();
    _coffeePageController = PageController(
      viewportFraction: 0.34,
      initialPage: _initialPage.toInt(),
    );
    _coffeePageController.addListener(_coffeeScrollListener);

    _coffeeNamePageController =
        PageController(initialPage: _initialPage.toInt());
    _coffeeNamePageController.addListener(_nameScrollListener);
  }

  @override
  void dispose() {
    _coffeePageController.removeListener(_coffeeScrollListener);
    _coffeePageController.dispose();

    _coffeeNamePageController.removeListener(_nameScrollListener);
    _coffeeNamePageController.dispose();
    super.dispose();
  }

  void _coffeeScrollListener() {
    setState(() {
      _coffeePage = _coffeePageController.page!;
    });
  }

  void _nameScrollListener() {
    _textPage = _coffeePage;
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: Stack(
        children: [
          Positioned(
            left: 20,
            right: 20,
            bottom: -_size.height * 0.25,
            height: _size.height * 0.3,
            child: const DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF8A624A),
                    offset: Offset.zero,
                    blurRadius: 90,
                    spreadRadius: 45,
                  ),
                ],
              ),
            ),
          ),
          Transform.scale(
            scale: 1.5,
            alignment: Alignment.bottomCenter,
            child: PageView.builder(
              controller: _coffeePageController,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              onPageChanged: (value) {
                if (value < coffees.length) {
                  _coffeeNamePageController.animateToPage(
                    value,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                  );
                }
              },
              itemCount: coffees.length + 1,
              itemBuilder: (context, index) {
                double value = _coffeePage - index + 1;
                value = -0.4 * value + 1;
                double opacity = value.clamp(0.0, 1.0);

                print(index);

                if (index == 0) {
                  return const SizedBox.shrink();
                }

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 600),
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            FadeTransition(
                          opacity: animation,
                          child: CoffeeDetails(
                            coffee: coffees[index - 1],
                          ),
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..translate(
                          0.0,
                          _size.height / 2.6 * (1 - value).abs(),
                        )
                        ..scale(value),
                      alignment: Alignment.bottomCenter,
                      child: Opacity(
                        opacity: opacity,
                        child: Hero(
                          tag: coffees[index - 1].image,
                          child: Image.asset(
                            coffees[index - 1].image,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            height: 120,
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 1.0, end: 0.0),
              duration: const Duration(milliseconds: 500),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(0.0, -100 * value),
                  child: child,
                );
              },
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _coffeeNamePageController,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: coffees.length,
                      itemBuilder: (context, index) {
                        final double opacity =
                            (1 - (index - _textPage).abs()).clamp(0.0, 1.0);

                        return Opacity(
                          opacity: opacity,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: _size.width * 0.2),
                            child: Hero(
                              tag: "text_${coffees[index].name}",
                              child: Material(
                                child: Text(
                                  coffees[index].name,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: const TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: Text(
                      "₹ ${coffees[_coffeePage.toInt()].price.toStringAsFixed(2)}",
                      key: Key(coffees[_coffeePage.toInt()].name),
                      style: const TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
