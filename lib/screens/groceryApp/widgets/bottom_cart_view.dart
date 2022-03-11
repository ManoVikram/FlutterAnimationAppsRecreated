import 'package:flutter/material.dart';

import '../constants.dart';
import '../controllers/home_controller.dart';

class BottomCartView extends StatelessWidget {
  const BottomCartView({
    Key? key,
    required HomeController controller,
  })  : _controller = controller,
        super(key: key);

  final HomeController _controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Cart",
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(width: defaultPadding),
        ...List.generate(
          _controller.cart.length,
          (index) => Padding(
            padding: const EdgeInsets.all(defaultPadding / 2),
            child: Hero(
              tag: _controller.cart[index].product!.title! + "_cart",
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage:
                    AssetImage(_controller.cart[index].product!.image!),
              ),
            ),
          ),
        ),
        const Spacer(),
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(
            _controller.totalItemsInCart().toString(),
            style: const TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
