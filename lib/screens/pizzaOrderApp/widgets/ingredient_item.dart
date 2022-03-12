import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/ingredients.dart';
import '../models/providers/pizza_selection_provider.dart';

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
      child: GestureDetector(
        onTap: () {
          /* if (_pizzaSelectionProvider.isIngredientPresent(ingredient)) {
            _pizzaSelectionProvider.removeIngredient(ingredient);
          } */
        },
        child: Consumer<PizzaSelectionProvider>(
          builder: (context, value, child) {
            return GestureDetector(
              onTap: () {
                if (value.isIngredientPresent(ingredient)) {
                  value.removeIngredient(ingredient);
                }
              },
              child: Container(
                height: 50.0,
                width: 50.0,
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5EED3),
                  shape: BoxShape.circle,
                  border: value.isIngredientPresent(ingredient)
                      ? Border.all(
                          color: Colors.orange,
                          width: 2.0,
                        )
                      : null,
                ),
                child: Image.asset(
                  ingredient.image,
                  fit: BoxFit.contain,
                ),
              ),
            );
          },
        ),
      ),
      data: ingredient,
    );
  }
}
