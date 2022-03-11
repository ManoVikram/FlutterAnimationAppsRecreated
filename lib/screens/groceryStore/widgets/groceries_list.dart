import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import './fruit_card.dart';
import '../models/fruits.dart';

class GroceriesList extends StatelessWidget {
  const GroceriesList({
    Key? key,
    required Size size,
  })  : _size = size,
        super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: MasonryGridView.count(
        physics: const BouncingScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 14.0,
        crossAxisSpacing: 14.0,
        itemCount: fruits.length,
        itemBuilder: (context, index) {
          return FruitCard(
            size: _size,
            index: index,
          );
        },
      ),
    );
  }
}
