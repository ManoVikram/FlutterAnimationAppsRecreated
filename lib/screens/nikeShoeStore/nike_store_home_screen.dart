import 'package:flutter/material.dart';

import './nike_shoe_details_screen.dart';
import './models/nike_shoe.dart';
import './widgets/nike_shoe_card.dart';

class NikeStoreHomeScreen extends StatelessWidget {
  NikeStoreHomeScreen({Key? key}) : super(key: key);

  final ValueNotifier<bool> isBottomBarVisibleNotifier =
      ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  "lib/screens/nikeShoeStore/assets/nike_logo.png",
                  height: 60.0,
                ),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: shoes.length,
                    itemBuilder: (context, index) {
                      const double itemBoxHeight = 380.0;

                      return NikeShoeCard(
                        itemBoxHeight: itemBoxHeight,
                        index: index,
                        onTap: () async {
                          isBottomBarVisibleNotifier.value = false;
                          await Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return FadeTransition(
                                  opacity: animation,
                                  child:
                                      NikeShoeDetailsScreen(shoe: shoes[index]),
                                );
                              },
                            ),
                          );
                          isBottomBarVisibleNotifier.value = true;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: isBottomBarVisibleNotifier,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300]!,
                    offset: const Offset(-5, -3),
                    blurRadius: 20.0,
                  ),
                ],
              ),
              child: Row(
                children: const [
                  Expanded(
                    child: Icon(
                      Icons.home,
                      size: 30.0,
                    ),
                  ),
                  Expanded(
                    child: Icon(
                      Icons.search,
                      size: 30.0,
                    ),
                  ),
                  Expanded(
                    child: Icon(
                      Icons.favorite_border,
                      size: 30.0,
                    ),
                  ),
                  Expanded(
                    child: Icon(
                      Icons.shopping_basket_outlined,
                      size: 30.0,
                    ),
                  ),
                  Expanded(
                    child: CircleAvatar(
                      radius: 16.0,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(
                          "lib/screens/nikeShoeStore/assets/nike_logo.png"),
                    ),
                  ),
                ],
              ),
            ),
            builder: (context, value, child) {
              return AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                bottom: value ? 0 : -kToolbarHeight,
                left: 0,
                right: 0,
                height: kToolbarHeight,
                child: child!,
              );
            },
          ),
        ],
      ),
    );
  }
}




