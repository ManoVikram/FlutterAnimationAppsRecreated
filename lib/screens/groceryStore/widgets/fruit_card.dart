import 'package:flutter/material.dart';

import '../fruit_details_screen.dart';
import '../models/fruits.dart';

class FruitCard extends StatelessWidget {
  const FruitCard({
    Key? key,
    required Size size,
    required this.index,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 500),
              pageBuilder: (context, animation, secondaryAnimation) =>
                  FruitDetailsScreen(fruit: fruits[index]),
            )
            /* MaterialPageRoute(
            builder: (context) => FruitDetailsScreen(
              fruit: fruits[index],
            ),
          ), */
            );
      },
      child: Container(
        height: _size.height * 0.35,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Hero(
                tag: fruits[index].name,
                child: Image.asset(
                  fruits[index].image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "₹${fruits[index].price}",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    fruits[index].name,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Text(
                    "1 KG",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
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
