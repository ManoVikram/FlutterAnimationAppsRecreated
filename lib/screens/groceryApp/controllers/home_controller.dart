import 'package:flutter/material.dart';

import '../models/Product.dart';
import '../models/ProductItem.dart';

enum HomeState { normal, cart }

class HomeController extends ChangeNotifier {
  HomeState homeState = HomeState.normal;

  List<ProductItem> cart = [];

  void changeHomeState(HomeState state) {
    homeState = state;
    notifyListeners();
  }

  void addProductToCart(Product product) {
    for (ProductItem item in cart) {
      if (item.product!.title == product.title) {
        item.increment();
        notifyListeners();
        return;
      }
    }

    cart.add(ProductItem(product: product));
    notifyListeners();

    return;
  }

  int totalItemsInCart() =>
      cart.fold(0, (previousValue, item) => previousValue + item.quantity);
}
