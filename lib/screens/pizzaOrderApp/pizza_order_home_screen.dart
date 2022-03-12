import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './models/ingredients.dart';
import './widgets/add_to_cart_button.dart';
import './widgets/ingredient_item.dart';
import './widgets/pizza.dart';

import './models/providers/pizza_selection_provider.dart';

class PizzaOrderHomeScreen extends StatefulWidget {
  const PizzaOrderHomeScreen({Key? key}) : super(key: key);

  @override
  State<PizzaOrderHomeScreen> createState() => _PizzaOrderHomeScreenState();
}

class _PizzaOrderHomeScreenState extends State<PizzaOrderHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (context) => PizzaSelectionProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "New Orleans Pizza",
            style: TextStyle(
              color: Colors.brown,
              fontSize: 28.0,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.brown,
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Positioned.fill(
              bottom: 50.0,
              left: 10.0,
              right: 10.0,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Column(
                  children: [
                    // Pizza image and price
                    const Expanded(
                      flex: 4,
                      child: Pizza(),
                    ),
                    // Pizza Ingredient Items
                    Expanded(
                      flex: 2,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: ingredients.length,
                        itemBuilder: (context, index) {
                          return IngredientItem(ingredient: ingredients[index]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Cart button
            Positioned(
              bottom: 25.0,
              left:
                  size.width / 2 - 25 / 2, //* 50 / 2 -> Size of the button by 2
              height: 50.0,
              width: 50.0,
              child: AddToCartButton(
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
