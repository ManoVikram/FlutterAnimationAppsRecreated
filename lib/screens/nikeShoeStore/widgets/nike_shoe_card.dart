import 'package:flutter/material.dart';

import '../models/nike_shoe.dart';

class NikeShoeCard extends StatelessWidget {
  const NikeShoeCard({
    Key? key,
    required this.itemBoxHeight,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  final double itemBoxHeight;
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: index == shoes.length - 1 ? kToolbarHeight + 10.0 : 30.0),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: itemBoxHeight,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: Hero(
                  tag: "background_${shoes[index].modelName}",
                  child: Container(
                    decoration: BoxDecoration(
                      color: shoes[index].color,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: "modelNumber_${shoes[index].modelName}",
                  child: SizedBox(
                    height: itemBoxHeight * 0.8,
                    child: FittedBox(
                      child: Text(
                        "${shoes[index].modelNumber}",
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.1),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 20.0,
                left: 70.0,
                height: itemBoxHeight * 0.7,
                child: Hero(
                  tag: "shoeImage_${shoes[index].modelName}",
                  child: Image.asset(
                    shoes[index].images.first,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const Positioned(
                bottom: 20.0,
                left: 20.0,
                child: Icon(
                  Icons.favorite_border,
                  size: 30.0,
                  color: Colors.grey,
                ),
              ),
              const Positioned(
                bottom: 20.0,
                right: 20.0,
                child: Icon(
                  Icons.shopping_bag_outlined,
                  size: 30.0,
                  color: Colors.grey,
                ),
              ),
              Positioned(
                bottom: 10.0,
                left: 0,
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      shoes[index].modelName,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      "₹${shoes[index].oldPrice.toInt()}",
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 16.0,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    Text(
                      "₹${shoes[index].newPrice.toInt()}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}