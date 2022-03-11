import 'package:flutter/material.dart';

import '../constants.dart';

import './favourite_button.dart';
import './price_text.dart';
import '../models/Product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onPressed;

  const ProductCard({
    Key? key,
    required this.product,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(defaultPadding / 1.5),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: const BorderRadius.all(Radius.circular(25)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: product.title!,
              child: Image.asset(product.image!),
            ),
            const Spacer(),
            Text(
              product.title!,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              product.category!,
              style: Theme.of(context).textTheme.caption,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PriceText(price: product.price!),
                const FavouriteButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
