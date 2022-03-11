import 'dart:math';

import 'package:flutter/material.dart';

import './models/boat.dart';

class BoatDetailsScreen extends StatefulWidget {
  final Boat boat;

  const BoatDetailsScreen({
    Key? key,
    required this.boat,
  }) : super(key: key);

  @override
  State<BoatDetailsScreen> createState() => _BoatDetailsScreenState();
}

class _BoatDetailsScreenState extends State<BoatDetailsScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 250),
    )..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              leading: IconButton(
                onPressed: () async {
                  _animationController.reverse();
                  await Future.delayed(const Duration(milliseconds: 250));
                  Navigator.pop(context);
                },
                icon: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.close,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  top: kToolbarHeight + 120,
                  left: 0,
                  right: _animationController.value == 1.0 ? 150 : 0,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Hero(
                      tag: widget.boat.title,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateZ(-(pi / 2) * _animationController.value),
                        child: Image.asset(
                          widget.boat.image,
                          height: _size.height * 0.6,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            /* Hero(
              tag: boat.title,
              child: Image.asset(
                boat.image,
                height: _size.height * 0.5,
              ),
            ), */
            Positioned(
              top: _size.height * 0.25,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.boat.title,
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: "By ",
                        style: const TextStyle(
                          fontSize: 24.0,
                          color: Colors.grey,
                        ),
                        children: [
                          TextSpan(
                            text: widget.boat.designer,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: _size.width,
                      child: Text(
                        widget.boat.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      "SPEC",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: _size.width * 0.4,
                              child: Text(
                                "Boat Length",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Text(
                              widget.boat.boatLength,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                    color: Colors.grey,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            SizedBox(
                              width: _size.width * 0.4,
                              child: Text(
                                "Beam",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Text(
                              widget.boat.beam,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                    color: Colors.grey,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            SizedBox(
                              width: _size.width * 0.4,
                              child: Text(
                                "Weight",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Text(
                              widget.boat.weight,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                    color: Colors.grey,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            SizedBox(
                              width: _size.width * 0.4,
                              child: Text(
                                "Fuel Capacity",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Text(
                              widget.boat.fuelCapacity,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                    color: Colors.grey,
                                  ),
                            ),
                          ],
                        ),
                      ],
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
