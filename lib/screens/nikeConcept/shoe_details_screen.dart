import 'package:flutter/material.dart';

import './models/shoe.dart';
import './widgets/custom_button.dart';
import './widgets/shake_transition.dart';

class ShoeDetailsScreen extends StatefulWidget {
  final Shoe shoe;

  const ShoeDetailsScreen({
    Key? key,
    required this.shoe,
  }) : super(key: key);

  @override
  State<ShoeDetailsScreen> createState() => _ShoeDetailsScreenState();
}

class _ShoeDetailsScreenState extends State<ShoeDetailsScreen> {
  int _indexValueColor = 0;
  int _indexValueSize = 1;

  double shoeSizes(int index, Size size) {
    switch (index) {
      case 0:
        return size.height * 0.09;
      case 1:
        return size.height * 0.07;
      case 2:
        return size.height * 0.05;
      case 3:
        return size.height * 0.03;
      default:
        return size.height * 0.05;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: -_size.height * 0.15,
              right: -_size.height * 0.20,
              child: TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 300),
                tween: Tween(begin: 0, end: 1),
                builder: (context, value, _) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: value * _size.height * 0.5,
                    width: value * _size.height * 0.5,
                    decoration: BoxDecoration(
                      color: widget.shoe.imagesList[_indexValueColor].color,
                      shape: BoxShape.circle,
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: kToolbarHeight,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite),
                  ),
                ],
              ),
            ),
            Positioned(
              top: _size.height * 0.2,
              right: 0,
              left: 0,
              child: FittedBox(
                child: Text(
                  widget.shoe.category,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[100],
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              top: _size.height * 0.22,
              // right: _size.height * 0.07,
              // left: _size.height * 0.07,
              left: shoeSizes(_indexValueSize, _size),
              right: shoeSizes(_indexValueSize, _size),
              child: Hero(
                tag: widget.shoe.name,
                child: Image.asset(
                  widget.shoe.imagesList[_indexValueColor].image,
                ),
              ),
            ),
            Positioned(
              top: _size.height * 0.6,
              left: 16,
              right: 16,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ShakeTransition(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.shoe.category,
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              widget.shoe.name,
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ShakeTransition(
                        left: false,
                        child: Text(
                          widget.shoe.price,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ShakeTransition(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Row(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              color: widget.shoe.punctuation > index
                                  ? widget
                                      .shoe.imagesList[_indexValueColor].color
                                  : Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "SIZE",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: List.generate(
                            4,
                            (index) => Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: CustomButton(
                                onTap: () {
                                  setState(() {
                                    _indexValueSize = index;
                                  });
                                },
                                color: index == _indexValueSize
                                    ? widget
                                        .shoe.imagesList[_indexValueColor].color
                                    : Colors.white,
                                child: Text(
                                  "${index + 7}",
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w600,
                                    color: index == _indexValueSize
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: _size.height * 0.84,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ShakeTransition(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "COLOR",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: List.generate(
                            widget.shoe.imagesList.length,
                            (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  _indexValueColor = index;
                                });
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                margin: const EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                  color: widget.shoe.imagesList[index].color,
                                  shape: BoxShape.circle,
                                  border: index == _indexValueColor
                                      ? Border.all(
                                          color: Colors.white,
                                          width: 2,
                                        )
                                      : null,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ShakeTransition(
                    left: false,
                    child: CustomButton(
                      onTap: () {},
                      width: 100,
                      color: widget.shoe.imagesList[_indexValueColor].color,
                      child: const Text(
                        "BUY",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
