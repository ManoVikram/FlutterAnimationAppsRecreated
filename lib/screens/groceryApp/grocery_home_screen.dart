import 'package:flutter/material.dart';

import './constants.dart';

import './grocery_details_screen.dart';
import './controllers/home_controller.dart';
import './widgets/product_card.dart';
import './widgets/home_header.dart';
import './widgets/bottom_cart_view.dart';
import './widgets/detailed_cart_view.dart';
import './models/Product.dart';

class GroceryApp extends StatefulWidget {
  const GroceryApp({Key? key}) : super(key: key);

  @override
  State<GroceryApp> createState() => _GroceryAppState();
}

class _GroceryAppState extends State<GroceryApp> {
  final _controller = HomeController();

  void onVerticalDrag(DragUpdateDetails details) {
    if (details.primaryDelta! < -0.7) {
      _controller.changeHomeState(HomeState.cart);
    } else if (details.primaryDelta! > 12) {
      _controller.changeHomeState(HomeState.normal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        bottom: false,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    AnimatedPositioned(
                      top: _controller.homeState == HomeState.normal
                          ? headerHeight
                          : -(constraints.maxHeight -
                              headerHeight -
                              cartBarHeight * 2),
                      left: 0,
                      right: 0,
                      duration: panelTransition,
                      height:
                          constraints.maxHeight - headerHeight - cartBarHeight,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(defaultPadding * 2),
                            bottomRight: Radius.circular(defaultPadding * 2),
                          ),
                        ),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.655,
                            crossAxisSpacing: defaultPadding,
                            mainAxisSpacing: defaultPadding,
                          ),
                          itemCount: products.length,
                          itemBuilder: (context, index) => ProductCard(
                            product: products[index],
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration:
                                      const Duration(milliseconds: 500),
                                  reverseTransitionDuration:
                                      const Duration(milliseconds: 500),
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      FadeTransition(
                                    opacity: animation,
                                    child: GroceryDetailsScreen(
                                      product: products[index],
                                      onProductAdd: () {
                                        _controller
                                            .addProductToCart(products[index]);
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      duration: panelTransition,
                      height: _controller.homeState == HomeState.normal
                          ? cartBarHeight
                          : constraints.maxHeight - headerHeight,
                      child: GestureDetector(
                        onVerticalDragUpdate: onVerticalDrag,
                        child: Container(
                          alignment: Alignment.topCenter,
                          color: bgColor,
                          child: Padding(
                            padding: const EdgeInsets.all(defaultPadding),
                            child: AnimatedSwitcher(
                              duration: panelTransition,
                              child: _controller.homeState == HomeState.normal
                                  ? BottomCartView(controller: _controller)
                                  : DetailedCartView(controller: _controller),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // It is brought to the bottom to bring it to the top
                    // In Stack, the bottom most Widget will be at the top
                    // And the Widget at the top will be at the bottom
                    AnimatedPositioned(
                      top: _controller.homeState == HomeState.normal
                          ? 0
                          : -headerHeight,
                      right: 0,
                      left: 0,
                      duration: panelTransition,
                      height: headerHeight,
                      child: const HomeHeader(),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
