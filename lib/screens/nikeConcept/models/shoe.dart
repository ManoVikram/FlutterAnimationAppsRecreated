import 'package:flutter/material.dart';

class ShoeImage {
  final String image;
  final Color color;

  ShoeImage(
    this.image,
    this.color,
  );
}

class Shoe {
  final String name;
  final String category;
  final String price;
  final int punctuation;
  final List<ShoeImage> imagesList;

  Shoe(
    this.name,
    this.category,
    this.price,
    this.punctuation,
    this.imagesList,
  );
}
