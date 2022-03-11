import 'package:flutter/material.dart';
import 'package:learning_flutter_animations/screens/groceryApp/widgets/price_text.dart';

import './constants.dart';

import './widgets/favourite_button.dart';
import './widgets/cart_counter.dart';
import './models/Product.dart';

class GroceryDetailsScreen extends StatefulWidget {
  final Product product;
  final VoidCallback onProductAdd;

  const GroceryDetailsScreen({
    Key? key,
    required this.product,
    required this.onProductAdd,
  }) : super(key: key);

  @override
  State<GroceryDetailsScreen> createState() => _GroceryDetailsScreenState();
}

class _GroceryDetailsScreenState extends State<GroceryDetailsScreen> {
  String _cartTag = "";

  AppBar appBar() {
    return AppBar(
      leading: const BackButton(
        color: Colors.black,
      ),
      backgroundColor: bgColor,
      elevation: 0,
      title: Text(
        widget.product.category!,
        style: const TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      actions: const [
        FavouriteButton(radius: 20),
        SizedBox(
          width: defaultPadding,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: appBar(),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding,
            vertical: defaultPadding / 2,
          ),
          child: ElevatedButton(
            onPressed: () {
              widget.onProductAdd();
              setState(() {
                _cartTag = "_cart";
              });
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              primary: primaryColor,
              shape: const StadiumBorder(),
              padding: const EdgeInsets.all(defaultPadding),
            ),
            child: const Text("Add To Cart"),
          ),
        ),
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.3,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Hero(
                  tag: widget.product.title! + _cartTag,
                  child: Image.asset(widget.product.image!),
                ),
                const Positioned(
                  bottom: -20,
                  child: CartCounter(),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.product.title!,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                PriceText(price: widget.product.price!),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: Text(
              // "Cabbage (comprising several cultivars of Brassica oleracea) is a leafy green, red (purple), or white (pale green) biennial plant grown as an annual vegetable crop for its dense-leaved heads. It is descended from the wild cabbage (B. oleracea var. oleracea), and belongs to the cole crops or brassicas, meaning it is closely related to broccoli and cauliflower (var. botrytis); Brussels sprouts (var. gemmifera); and Savoy cabbage (var. sabauda).",
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec volutpat et ipsum at egestas. Nulla a mauris vel nunc convallis aliquam. Nunc sit amet aliquam est. Nulla placerat tellus vel mauris efficitur, in porta sapien varius. Proin vulputate libero justo. In quis nunc vel tellus accumsan tincidunt.",
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              maxLines: 8,
              style: TextStyle(
                color: Colors.grey,
                height: 1.8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
