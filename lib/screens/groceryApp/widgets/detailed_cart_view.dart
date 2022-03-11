import 'package:flutter/material.dart';

import './price_text.dart';
import '../constants.dart';
import '../controllers/home_controller.dart';

class DetailedCartView extends StatelessWidget {
  const DetailedCartView({
    Key? key,
    required HomeController controller,
  })  : _controller = controller,
        super(key: key);

  final HomeController _controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cart",
            style: Theme.of(context).textTheme.headline6,
          ),
          ...List.generate(
            _controller.cart.length,
            (index) => ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: defaultPadding / 2),
              leading: CircleAvatar(
                radius: 26,
                backgroundColor: Colors.white,
                backgroundImage:
                    AssetImage(_controller.cart[index].product!.image!),
              ),
              title: Text(
                _controller.cart[index].product!.title!,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              trailing: FittedBox(
                child: Row(
                  children: [
                    const PriceText(
                      price: "20.00",
                    ),
                    Text(
                      " x ${_controller.cart[index].quantity}",
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: primaryColor,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.all(defaultPadding),
              ),
              child: const Text("Next - \$30"),
            ),
          ),
        ],
      ),
    );
  }
}
