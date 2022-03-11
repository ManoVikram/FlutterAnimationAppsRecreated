import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './models/fruits.dart';
import './models/cart.dart';

class FruitDetailsScreen extends StatefulWidget {
  final Fruit fruit;

  const FruitDetailsScreen({
    Key? key,
    required this.fruit,
  }) : super(key: key);

  @override
  State<FruitDetailsScreen> createState() => _FruitDetailsScreenState();
}

class _FruitDetailsScreenState extends State<FruitDetailsScreen> {
  late String imageTag;

  @override
  void initState() {
    super.initState();
    imageTag = widget.fruit.name;
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    final Cart cartProvider = context.watch<Cart>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: const BackButton(color: Colors.black),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Fruit Image
                    SizedBox(
                      height: _size.height * 0.4,
                      width: double.infinity,
                      child: Hero(
                        tag: imageTag,
                        child: Image.asset(
                          widget.fruit.image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    // Fruit Details
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.fruit.name,
                          style:
                              Theme.of(context).textTheme.headline3!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          "1000g",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Colors.grey),
                        ),
                        const SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 40.0,
                              width: 120.0,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Icon(Icons.remove),
                                  Text("1"),
                                  Icon(Icons.add),
                                ],
                              ),
                            ),
                            Text(
                              "₹${widget.fruit.price}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        const Text(
                          "About the product",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          widget.fruit.description,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 100.0),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Bottom Bar
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 100,
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(30.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      radius: 24.0,
                      child: Icon(
                        Icons.favorite_border,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        cartProvider.addItemToCart(widget.fruit);
                        setState(() {
                          imageTag = imageTag + "_cart";
                        });
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellow,
                        onPrimary: Colors.white,
                        elevation: 0.0,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.all(16.0),
                        minimumSize: Size(_size.width * 0.6, 80),
                      ),
                      child: const Text(
                        "Add to cart",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
