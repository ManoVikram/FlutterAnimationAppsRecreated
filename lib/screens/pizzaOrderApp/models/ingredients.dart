import 'package:flutter/cupertino.dart';

class Ingredient {
  final String image;
  final String toppingImage;
  final List<Offset> ingredientPositions;

  const Ingredient({
    required this.image,
    required this.toppingImage,
    required this.ingredientPositions,
  });

  bool compare(Ingredient ingredient) => ingredient.image == image;
}

final List<Ingredient> ingredients = [
  const Ingredient(
    image: "lib/screens/pizzaOrderApp/assets/chili.png",
    toppingImage: "lib/screens/pizzaOrderApp/assets/chili_unit.png",
    ingredientPositions: [
      Offset(0.5, 0.7),
      Offset(0.3, 0.2),
      Offset(0.5, 0.5),
      Offset(0.6, 0.3),
      Offset(0.4, 0.65),
    ],
  ),
  const Ingredient(
    image: "lib/screens/pizzaOrderApp/assets/garlic.png",
    toppingImage: "lib/screens/pizzaOrderApp/assets/garlic.png",
    ingredientPositions: [
      Offset(0.5, 0.35),
      Offset(0.65, 0.35),
      Offset(0.45, 0.3),
      Offset(0.4, 0.2),
      Offset(0.3, 0.6),
    ],
  ),
  const Ingredient(
    image: "lib/screens/pizzaOrderApp/assets/olive.png",
    toppingImage: "lib/screens/pizzaOrderApp/assets/olive_unit.png",
    ingredientPositions: [
      Offset(0.25, 0.5),
      Offset(0.65, 0.6),
      Offset(0.5, 0.5),
      Offset(0.4, 0.2),
      Offset(0.2, 0.6),
    ],
  ),
  const Ingredient(
    image: "lib/screens/pizzaOrderApp/assets/onion.png",
    toppingImage: "lib/screens/pizzaOrderApp/assets/onion.png",
    ingredientPositions: [
      Offset(0.2, 0.65),
      Offset(0.65, 0.3),
      Offset(0.25, 0.25),
      Offset(0.45, 0.35),
      Offset(0.4, 0.65),
    ],
  ),
  const Ingredient(
    image: "lib/screens/pizzaOrderApp/assets/pea.png",
    toppingImage: "lib/screens/pizzaOrderApp/assets/pea_unit.png",
    ingredientPositions: [
      Offset(0.2, 0.35),
      Offset(0.65, 0.35),
      Offset(0.3, 0.25),
      Offset(0.5, 0.2),
      Offset(0.3, 0.5),
    ],
  ),
  const Ingredient(
    image: "lib/screens/pizzaOrderApp/assets/pickle.png",
    toppingImage: "lib/screens/pizzaOrderApp/assets/pickle_unit.png",
    ingredientPositions: [
      Offset(0.2, 0.65),
      Offset(0.65, 0.3),
      Offset(0.25, 0.25),
      Offset(0.45, 0.35),
      Offset(0.4, 0.65),
    ],
  ),
  const Ingredient(
    image: "lib/screens/pizzaOrderApp/assets/potato.png",
    toppingImage: "lib/screens/pizzaOrderApp/assets/potato_unit.png",
    ingredientPositions: [
      Offset(0.2, 0.2),
      Offset(0.6, 0.2),
      Offset(0.4, 0.25),
      Offset(0.5, 0.3),
      Offset(0.4, 0.65),
    ],
  ),
];
