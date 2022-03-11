import 'package:flutter/material.dart';

class Skin {
  final String image;
  final String colorName;
  final Color color;
  final Alignment alignment;

  Skin({
    required this.image,
    required this.colorName,
    required this.color,
    required this.alignment,
  });
}

List<Skin> allSkins = [
  Skin(
    image: "lib/screens/dbrand_skin_selection/assets/red.png",
    colorName: "Sunset Red",
    color: const Color(0xFFE86B6A),
    alignment: Alignment.topRight,
  ),
  Skin(
    image: "lib/screens/dbrand_skin_selection/assets/orange.png",
    colorName: "Sunrise Orange",
    color: const Color(0xFFFE9968),
    alignment: Alignment.centerRight,
  ),
  Skin(
    image: "lib/screens/dbrand_skin_selection/assets/yellow.png",
    colorName: "Mellow Yellow",
    color: const Color(0xFFFFD386),
    alignment: Alignment.bottomLeft,
  ),
  Skin(
    image: "lib/screens/dbrand_skin_selection/assets/green.png",
    colorName: "Seafoam Green",
    color: const Color(0xFF6DE4B2),
    alignment: Alignment.bottomCenter,
  ),
  Skin(
    image: "lib/screens/dbrand_skin_selection/assets/blue.png",
    colorName: "Sky Blue",
    color: const Color(0xFF7FE0EB),
    alignment: Alignment.topCenter,
  ),
  Skin(
    image: "lib/screens/dbrand_skin_selection/assets/purple.png",
    colorName: "King of Purple",
    color: const Color(0xFF98A2DF),
    alignment: Alignment.topLeft,
  ),
  Skin(
    image: "lib/screens/dbrand_skin_selection/assets/pink.png",
    colorName: "Off Pink",
    color: const Color(0xFFEBB9D2),
    alignment: Alignment.centerLeft,
  ),
  Skin(
    image: "lib/screens/dbrand_skin_selection/assets/grey.png",
    colorName: "Pastel Silver",
    color: const Color(0xFFD6D9D2),
    alignment: Alignment.center,
  ),
];
