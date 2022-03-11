import 'package:flutter/material.dart';

import '../models/cart.dart';
import '../models/grocery_store_provider.dart';

class ClosedCart extends StatelessWidget {
  const ClosedCart({
    Key? key,
    required GroceryStoreProvider groceryStoreProvider,
    required Cart cart,
    required Size size,
  })  : _groceryStoreProvider = groceryStoreProvider,
        _cart = cart,
        _size = size,
        super(key: key);

  final GroceryStoreProvider _groceryStoreProvider;
  final Cart _cart;
  final Size _size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            style: _groceryStoreProvider.getGroceryStoreState ==
                    GroceryStoreState.normal
                ? Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )
                : Theme.of(context).textTheme.headline3!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
            curve: Curves.ease,
            child: const Text(
              "Cart",
            ),
          ),
          /* ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 28.0,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    "lib/screens/groceryStore/assets/Banana.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            );
          },
        ), */
          const SizedBox(width: 10.0),
          SizedBox(
            width: _size.width * 0.6,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  _cart.getCartItems.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 26.0,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Hero(
                          tag: _cart.getCartItems[index].fruit.name + "_cart",
                          child: Image.asset(
                            _cart.getCartItems[index].fruit.image,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                  growable: false,
                ),
              ),
            ),
          ),
          const Spacer(),
          CircleAvatar(
            backgroundColor: Colors.yellow,
            radius: 26.0,
            child: Text(
              "${_cart.getTotalItems}",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}