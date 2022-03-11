import 'package:flutter/material.dart';

import '../models/ingredients.dart';

class IngredientItem extends StatelessWidget {
  final Ingredient ingredient;

  const IngredientItem({
    Key? key,
    required this.ingredient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable(
      feedback: DecoratedBox(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(3.0, 5.0),
              blurRadius: 10.0,
              spreadRadius: 5.0,
            ),
          ],
        ),
        child: Container(
          height: 50.0,
          width: 50.0,
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          padding: const EdgeInsets.all(5.0),
          decoration: const BoxDecoration(
            color: Color(0xFFF5EED3),
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            ingredient.image,
            fit: BoxFit.contain,
          ),
        ),
      ),
      child: Container(
        height: 50.0,
        width: 50.0,
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        padding: const EdgeInsets.all(5.0),
        decoration: const BoxDecoration(
          color: Color(0xFFF5EED3),
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          ingredient.image,
          fit: BoxFit.contain,
        ),
      ),
      data: ingredient,
    );
  }
}
