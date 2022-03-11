import 'package:flutter/cupertino.dart';

class NikeShoe {
  final String modelName;
  final double oldPrice;
  final double newPrice;
  final List<String> images;
  final int modelNumber;
  final Color color;

  NikeShoe({
    required this.modelName,
    required this.oldPrice,
    required this.newPrice,
    required this.images,
    required this.modelNumber,
    required this.color,
  });
}

final List<NikeShoe> shoes = [
  NikeShoe(
    modelName: "AIR MAX 90 EX BLACK",
    oldPrice: 10000,
    newPrice: 15000,
    images: [
      "lib/screens/nikeShoeStore/assets/shoes1_1.png",
      "lib/screens/nikeShoeStore/assets/shoes1_2.png",
      "lib/screens/nikeShoeStore/assets/shoes1_3.png",
    ],
    color: const Color(0xFFF6F6F6),
    modelNumber: 90,
  ),
  NikeShoe(
    modelName: "AIR MAX 270 GOLD",
    oldPrice: 9000,
    newPrice: 4000,
    images: [
      "lib/screens/nikeShoeStore/assets/shoes2_1.png",
      "lib/screens/nikeShoeStore/assets/shoes2_2.png",
      "lib/screens/nikeShoeStore/assets/shoes2_3.png",
    ],
    color: const Color(0xFFFCF5EB),
    modelNumber: 270,
  ),
  NikeShoe(
    modelName: "AIR MAX 95 RED",
    oldPrice: 20000,
    newPrice: 10000,
    images: [
      "lib/screens/nikeShoeStore/assets/shoes3_1.png",
      "lib/screens/nikeShoeStore/assets/shoes3_2.png",
      "lib/screens/nikeShoeStore/assets/shoes3_3.png",
    ],
    color: const Color(0XFFFEEFEF),
    modelNumber: 95,
  ),
  NikeShoe(
    modelName: "AIR MAX 98 FREE",
    oldPrice: 6000,
    newPrice: 18000,
    images: [
      "lib/screens/nikeShoeStore/assets/shoes4_1.png",
      "lib/screens/nikeShoeStore/assets/shoes4_2.png",
      "lib/screens/nikeShoeStore/assets/shoes4_3.png",
    ],
    color: const Color(0xFFEDF3FE),
    modelNumber: 98,
  ),
];
