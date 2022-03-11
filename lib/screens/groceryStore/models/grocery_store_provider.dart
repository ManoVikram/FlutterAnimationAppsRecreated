import 'package:flutter/material.dart';

enum GroceryStoreState {
  normal,
  details,
  cart,
}

class GroceryStoreProvider extends ChangeNotifier {
  GroceryStoreState _groceryStoreState = GroceryStoreState.normal;

  void changeGroceryStoreStateToNormal() {
    _groceryStoreState = GroceryStoreState.normal;
    notifyListeners();
  }

  void changeGroceryStoreStateToDetails() {
    _groceryStoreState = GroceryStoreState.details;
    notifyListeners();
  }

  void changeGroceryStoreStateToCart() {
    _groceryStoreState = GroceryStoreState.cart;
    notifyListeners();
  }

  GroceryStoreState get getGroceryStoreState => _groceryStoreState;
}
