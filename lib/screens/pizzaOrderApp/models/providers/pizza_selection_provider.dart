import 'package:flutter/foundation.dart';
import 'package:learning_flutter_animations/screens/pizzaOrderApp/models/ingredients.dart';

class PizzaSelectionProvider extends ChangeNotifier {
  final List<Ingredient> _addedIngredients = [];

  int _totalCost = 499;

  List<Ingredient> get getAddedIngredients => _addedIngredients;

  int get getTotalCost => _totalCost;

  void addIngredient(Ingredient ingredient) {
    _addedIngredients.add(ingredient);
    _totalCost += 20;

    notifyListeners();
  }

  void removeIngredient(Ingredient ingredient) {
    _addedIngredients.remove(ingredient);
    _totalCost -= 20;

    notifyListeners();
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
