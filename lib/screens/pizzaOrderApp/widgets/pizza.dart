import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './pizza_size_button.dart';

import '../models/ingredients.dart';
import '../models/pizza_size_state.dart';

import '../models/providers/pizza_selection_provider.dart';

class Pizza extends StatefulWidget {
  const Pizza({
    Key? key,
  }) : super(key: key);

  @override
  State<Pizza> createState() => PizzaState();
}

class PizzaState extends State<Pizza> with TickerProviderStateMixin {
  final ValueNotifier<bool> _pizzaFocusedNotifier = ValueNotifier<bool>(false);

  late final AnimationController _animationController;
  late final AnimationController _rotationAnimationController;

  List<Animation> _allAnimations = [];

  late BoxConstraints _pizzaBoxConstraints;

  final ValueNotifier<PizzaSizeState> _pizzaSizeStateNotifier =
      ValueNotifier<PizzaSizeState>(
          PizzaSizeState(value: PizzaSizeValues.medium));

  final _pizzaKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _rotationAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 600,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _rotationAnimationController.dispose();
    super.dispose();
  }

  Widget _buildIngredients(List<Ingredient> addedIngredients) {
    List<Widget> ingredientElements = [];

    if (_allAnimations.isNotEmpty) {
      for (var i = 0; i < addedIngredients.length; i++) {
        for (var j = 0;
            j < addedIngredients[i].ingredientPositions.length;
            j++) {
          final Animation animation = _allAnimations[j];
          final Offset position = addedIngredients[i].ingredientPositions[j];
          final double x = position.dx;
          final double y = position.dy;

          if (i == addedIngredients.length - 1) {
            double fromX = 0.0, fromY = 0.0;

            if (j < 1) {
              fromX = -_pizzaBoxConstraints.maxWidth * (1 - animation.value);
            } else if (j < 2) {
              fromX = _pizzaBoxConstraints.maxWidth * (1 - animation.value);
            } else if (j < 4) {
              fromY = -_pizzaBoxConstraints.maxHeight * (1 - animation.value);
            } else {
              fromY = _pizzaBoxConstraints.maxHeight * (1 - animation.value);
            }

            print(ingredients[i].toppingImage);

            if (animation.value > 0) {
              ingredientElements.add(
                Opacity(
                  opacity: animation.value,
                  child: Transform(
                    transform: Matrix4.identity()
                      ..translate(
                        fromX + _pizzaBoxConstraints.maxWidth * x,
                        fromY + _pizzaBoxConstraints.maxHeight * y,
                      ),
                    child: Image.asset(
                      addedIngredients[i].toppingImage,
                      height: 30.0,
                    ),
                  ),
                ),
              );
            }
          } else {
            ingredientElements.add(
              Transform(
                transform: Matrix4.identity()
                  ..translate(
                    _pizzaBoxConstraints.maxWidth * x,
                    _pizzaBoxConstraints.maxHeight * y,
                  ),
                child: Image.asset(
                  addedIngredients[i].toppingImage,
                  height: 30.0,
                ),
              ),
            );
          }
        }
      }

      return Stack(
        children: ingredientElements,
      );
    }

    return SizedBox.fromSize();
  }

  void _buildIngredientsAnimation() {
    _allAnimations.clear();

    _allAnimations.add(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.0,
          0.8,
          curve: Curves.decelerate,
        ),
      ),
    );
    _allAnimations.add(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.2,
          0.8,
          curve: Curves.decelerate,
        ),
      ),
    );
    _allAnimations.add(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.4,
          1.0,
          curve: Curves.decelerate,
        ),
      ),
    );
    _allAnimations.add(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.1,
          0.7,
          curve: Curves.decelerate,
        ),
      ),
    );
    _allAnimations.add(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.3,
          1.0,
          curve: Curves.decelerate,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final PizzaSelectionProvider _pizzaSelectionProvider =
        context.watch<PizzaSelectionProvider>();

    return Stack(
      children: [
        Column(
          children: [
            // Pizza Image
            Expanded(
              child: DragTarget<Ingredient>(
                onAccept: (Ingredient ingredient) {
                  print("onAccept");

                  _pizzaFocusedNotifier.value = false;

                  _pizzaSelectionProvider.addIngredient(ingredient);

                  _buildIngredientsAnimation();

                  _animationController.forward(from: 0.0);
                },
                onWillAccept: (Ingredient? ingredient) {
                  print("onWillAccept");

                  _pizzaFocusedNotifier.value = true;

                  bool isIngredientPresent =
                      _pizzaSelectionProvider.isIngredientPresent(ingredient!);

                  return !isIngredientPresent;
                },
                onLeave: (Ingredient? ingredient) {
                  print("onLeave");

                  _pizzaFocusedNotifier.value = false;
                },
                builder: (context, candidateData, rejectedData) {
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      _pizzaBoxConstraints = constraints;

                      return ValueListenableBuilder<PizzaSizeState>(
                          valueListenable: _pizzaSizeStateNotifier,
                          builder: (context, pizzaSize, child) {
                            return RepaintBoundary(
                              key: _pizzaKey,
                              child: RotationTransition(
                                turns: CurvedAnimation(
                                  parent: _rotationAnimationController,
                                  curve: Curves.decelerate,
                                ),
                                child: Stack(
                                  children: [
                                    Center(
                                      child: ValueListenableBuilder<bool>(
                                        valueListenable: _pizzaFocusedNotifier,
                                        builder: (context, value, child) {
                                          return AnimatedContainer(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            height: value
                                                ? constraints.maxHeight *
                                                    pizzaSize.factor
                                                : constraints.maxHeight *
                                                        pizzaSize.factor -
                                                    20.0,
                                            // margin: const EdgeInsets.all(10.0),
                                            child: Stack(
                                              children: [
                                                DecoratedBox(
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black12,
                                                        blurRadius: 20.0,
                                                        offset:
                                                            Offset(5.0, 8.0),
                                                        spreadRadius: 5.0,
                                                      ),
                                                    ],
                                                  ),
                                                  child: Image.asset(
                                                      "lib/screens/pizzaOrderApp/assets/dish.png"),
                                                ),
                                                Image.asset(
                                                    "lib/screens/pizzaOrderApp/assets/pizza-0.png"),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    AnimatedBuilder(
                                      animation: _animationController,
                                      builder: (context, child) {
                                        return _buildIngredients(
                                            _pizzaSelectionProvider
                                                .getAddedIngredients);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 10.0),
            // Price of Pizza
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: animation.drive(
                      Tween<Offset>(
                        begin: const Offset(0.0, 0.0),
                        end: Offset(0.0, -animation.value),
                      ),
                    ),
                    child: child,
                  ),
                );
              },
              child: Text(
                "₹${_pizzaSelectionProvider.getTotalCost}",
                key: UniqueKey(),
                style: const TextStyle(
                  color: Colors.brown,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            // Pizza Size Button
            ValueListenableBuilder<PizzaSizeState>(
                valueListenable: _pizzaSizeStateNotifier,
                builder: (context, pizzaSize, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PizzaSizeButton(
                        isSelected: pizzaSize.value == PizzaSizeValues.small,
                        text: "S",
                        onTap: () {
                          _pizzaSizeStateNotifier.value =
                              PizzaSizeState(value: PizzaSizeValues.small);
                          _rotationAnimationController.forward(from: 0.0);
                        },
                      ),
                      PizzaSizeButton(
                        isSelected: pizzaSize.value == PizzaSizeValues.medium,
                        text: "M",
                        onTap: () {
                          _pizzaSizeStateNotifier.value =
                              PizzaSizeState(value: PizzaSizeValues.medium);
                          _rotationAnimationController.forward(from: 0.0);
                        },
                      ),
                      PizzaSizeButton(
                        isSelected: pizzaSize.value == PizzaSizeValues.large,
                        text: "L",
                        onTap: () {
                          _pizzaSizeStateNotifier.value =
                              PizzaSizeState(value: PizzaSizeValues.large);
                          _rotationAnimationController.forward(from: 0.0);
                        },
                      ),
                    ],
                  );
                }),
          ],
        ),
      ],
    );
  }
}
