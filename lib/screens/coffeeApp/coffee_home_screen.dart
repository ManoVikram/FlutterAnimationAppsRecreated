import 'package:flutter/material.dart';

import './coffee_list.dart';
import './models/coffee.dart';

class CoffeeHomeScreen extends StatelessWidget {
  const CoffeeHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onVerticalDragUpdate: (DragUpdateDetails details) {
          // This -10 is the amount of distance the user has swiped on the screen
          if (details.primaryDelta! < -10) {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 600),
                pageBuilder: (context, animation, secondaryAnimation) {
                  return FadeTransition(
                    opacity: animation,
                    child: const CoffeeList(),
                  );
                },
              ),
            );
          }
        },
        child: Stack(
          children: [
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFA89276),
                      Colors.white,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: _size.height * 0.15,
              left: 0,
              right: 0,
              height: _size.height * 0.4,
              child: Hero(
                tag: coffees[6].image,
                child: Image.asset(coffees[6].image),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: _size.height * 0.7,
              child: Hero(
                tag: coffees[7].image,
                child: Image.asset(
                  coffees[7].image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: -_size.height * 0.8,
              left: 0,
              right: 0,
              height: _size.height,
              child: Hero(
                tag: coffees[8].image,
                child: Image.asset(
                  coffees[8].image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: _size.height * 0.25,
              height: 140,
              child: Image.asset("lib/screens/coffeeApp/assets/logo.png"),
            ),
          ],
        ),
      ),
    );
  }
}
