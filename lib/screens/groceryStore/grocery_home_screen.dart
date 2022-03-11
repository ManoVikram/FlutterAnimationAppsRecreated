import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './widgets/custom_app_bar.dart';
import './widgets/groceries_list.dart';
import './widgets/closed_cart.dart';
import './widgets/opened_cart.dart';
import './models/grocery_store_provider.dart';
import './models/cart.dart';

class GroceryStoreHomeScreen extends StatefulWidget {
  const GroceryStoreHomeScreen({Key? key}) : super(key: key);

  @override
  State<GroceryStoreHomeScreen> createState() => _GroceryStoreHomeScreenState();
}

class _GroceryStoreHomeScreenState extends State<GroceryStoreHomeScreen> {
  double _cartBarHeight = 80.0;

  final GroceryStoreProvider _groceryStoreProvider = GroceryStoreProvider();

  void _onVerticalDrag(DragUpdateDetails details) {
    print(details.primaryDelta);

    if (details.primaryDelta! < -5.0) {
      _groceryStoreProvider.changeGroceryStoreStateToCart();
    } else if (details.primaryDelta! > 5.0) {
      _groceryStoreProvider.changeGroceryStoreStateToNormal();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return AnimatedBuilder(
      animation: _groceryStoreProvider,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Stack(
              children: [
                // List of Fruits
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.decelerate,
                  top: _groceryStoreProvider.getGroceryStoreState ==
                          GroceryStoreState.normal
                      ? -25
                      : -(_size.height) + 150,
                  left: 0,
                  right: 0,
                  height: _size.height - _cartBarHeight,
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    padding: const EdgeInsets.only(
                      top: kToolbarHeight + 30,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                    ),
                    child: GroceriesList(size: _size),
                  ),
                ),
                // Bottom Cart Bar
                Consumer<Cart>(
                  builder: (context, cart, child) {
                    return AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.decelerate,
                      top: _groceryStoreProvider.getGroceryStoreState ==
                              GroceryStoreState.normal
                          ? (_size.height - _cartBarHeight - 20)
                          : _cartBarHeight + 20,
                      left: 0,
                      right: 0,
                      height: _size.height,
                      child: GestureDetector(
                        onVerticalDragUpdate: _onVerticalDrag,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            switchInCurve: Curves.ease,
                            switchOutCurve: Curves.ease,
                            child: _groceryStoreProvider.getGroceryStoreState ==
                                    GroceryStoreState.normal
                                ? ClosedCart(
                                    groceryStoreProvider: _groceryStoreProvider,
                                    cart: cart,
                                    size: _size,
                                  )
                                : OpenedCart(
                                    cart: cart,
                                    size: _size,
                                  ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                // App Bar
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  top: _groceryStoreProvider.getGroceryStoreState ==
                          GroceryStoreState.normal
                      ? 0
                      : -kToolbarHeight - 20,
                  left: 0,
                  right: 0,
                  child: const CustomAppBar(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
