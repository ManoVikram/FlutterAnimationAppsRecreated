import 'package:flutter/foundation.dart';

import './fruits.dart';

class CartItem {
  final Fruit fruit;
  int quantity;

  CartItem({
    required this.fruit,
    this.quantity = 1,
  });
}

class Cart with ChangeNotifier {
  List<CartItem> _items = [];

  int _total = 0;

  List<CartItem> get getCartItems => _items;

  int get getTotalItems => _total;

  void addItemToCart(Fruit fruit) {
    bool isAlreadyPresent = false;

    int itemPresentIndex = -1;

    for (int i = 0; i < _items.length; i++) {
      if (_items[i].fruit.name == fruit.name) {
        isAlreadyPresent = true;
        itemPresentIndex = i;
        break;
      }
    }

    if (isAlreadyPresent) {
      _items[itemPresentIndex].quantity++;
    } else {
      _items.add(CartItem(fruit: fruit));
    }

    _total++;

    notifyListeners();
  }
}
