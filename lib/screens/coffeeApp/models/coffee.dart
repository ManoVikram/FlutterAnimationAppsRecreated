import 'dart:math';

class Coffee {
  final String name;
  final String image;
  final int price;

  Coffee({
    required this.name,
    required this.image,
    required this.price,
  });
}

final List<String> _coffeeNames = [
  "Caramel Macchiato",
  "Caramel Cold Drink",
  "Iced Coffe Mocha",
  "Caramelized Pecan Latte",
  "Toffee Nut Latte",
  "Capuchino",
  "Toffee Nut Iced Latte",
  "Americano",
  "Vietnamese-Style Iced Coffee",
  "Black Tea Latte",
  "Classic Irish Coffee",
  "Toffee Nut Crunch Latte",
];

final List<Coffee> coffees = List.generate(
  _coffeeNames.length,
  (index) => Coffee(
    name: _coffeeNames[index],
    image: "lib/screens/coffeeApp/assets/${index + 1}.png",
    price: (Random().nextInt(100) + 3).toInt(),
  ),
);
