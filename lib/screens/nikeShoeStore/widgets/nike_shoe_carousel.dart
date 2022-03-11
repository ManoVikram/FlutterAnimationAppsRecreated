import 'package:flutter/material.dart';

import '../models/nike_shoe.dart';

class NikeShoeCarousel extends StatelessWidget {
  const NikeShoeCarousel({
    Key? key,
    required Size size,
    required this.shoe,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final NikeShoe shoe;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        height: _size.height * 0.5,
        child: Stack(
          children: [
            Positioned.fill(
              child: Hero(
                tag: "background_${shoe.modelName}",
                child: Container(
                  color: shoe.color,
                ),
              ),
            ),
            Positioned(
              top: -50,
              left: 0,
              right: 0,
              child: Hero(
                tag: "modelNumber_${shoe.modelName}",
                child: FittedBox(
                  child: Text(
                    shoe.modelNumber.toString(),
                    style: TextStyle(
                      color: Colors.grey.withOpacity(0.07),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
            ),
            PageView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: shoe.images.length,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  child: Hero(
                    tag: index == 0
                        ? "shoeImage_${shoe.modelName}"
                        : "shoeImage_${shoe.modelName}_$index",
                    child: Image.asset(
                      shoe.images[index],
                      height: 250,
                      width: 250,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}