import 'package:flutter/material.dart';

import '../models/cart.dart';

class OpenedCart extends StatelessWidget {
  const OpenedCart({
    Key? key,
    required Cart cart,
    required Size size,
  })  : _cart = cart,
        _size = size,
        super(key: key);

  final Cart _cart;
  final Size _size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.black,
      child: Align(
        alignment: Alignment.topLeft,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Cart",
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 20.0),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _cart.getCartItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: ListTile(
                      minLeadingWidth: 70.0,
                      contentPadding: const EdgeInsets.all(0.0),
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30.0,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset(
                            _cart.getCartItems[index].fruit.image,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      title: Text.rich(
                        TextSpan(
                          style: Theme.of(context).textTheme.headline6!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                          text: "${_cart.getCartItems[index].quantity}   x   ",
                          children: [
                            TextSpan(text: _cart.getCartItems[index].fruit.name),
                          ],
                        ),
                      ),
                      // subtitle: const SizedBox.shrink(),
                      trailing: Text(
                        "₹${_cart.getCartItems[index].fruit.price}",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.grey[400]),
                      ),
                    ),
                  );
                },
              ),
              // const Spacer(),
              // const SizedBox(height: 100.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total: ",
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.grey[400]),
                  ),
                  Text(
                    "₹100",
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow,
                  shape: const StadiumBorder(),
                  minimumSize: const Size(double.infinity, 70),
                ),
                child: Text(
                  "Next",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.black),
                ),
              ),
              SizedBox(height: _size.height * 0.3),
            ],
          ),
        ),
      ),
    );
  }
}