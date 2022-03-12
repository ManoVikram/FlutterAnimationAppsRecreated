import 'package:flutter/foundation.dart';

import '../ingredients.dart';

class PizzaSelectionProvider extends ChangeNotifier {
  final List<Ingredient> _addedIngredients = [];

  Ingredient? _deletedIngredient;

  int _totalCost = 499;

  List<Ingredient> get getAddedIngredients => _addedIngredients;

  int get getTotalCost => _totalCost;

  Ingredient? get getDeletedIngredient => _deletedIngredient;

  void addIngredient(Ingredient ingredient) {
    _addedIngredients.add(ingredient);
    _totalCost += 20;

    notifyListeners();
  }

  void removeIngredient(Ingredient ingredient) {
    _deletedIngredient = ingredient;
    _addedIngredients.remove(ingredient);
    _totalCost -= 20;

    notifyListeners();
  }

  void refreshDeletedIngredient() {
    _deletedIngredient = null;
  }

  bool isIngredientPresent(Ingredient ingredient) {
    // If the ingredient is already added, it returns false
    // else return true.
    for (Ingredient ingridint in _addedIngredients) {
      if (ingridint.compare(ingredient)) {
        return true;
      }
    }

    return false;
  }
}
