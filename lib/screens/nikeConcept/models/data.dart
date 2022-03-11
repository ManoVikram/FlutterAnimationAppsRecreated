import 'package:flutter/material.dart';

import '../models/shoe.dart';

final List<String> categories = ["Basketball", "Running", "Training"];

final List<Shoe> shoes = [
  Shoe(
    "AIR JORDAN 1 MID",
    "NIKE AIR",
    "₹8000",
    4,
    [
      ShoeImage(
        "lib/screens/nikeConcept/assets/J_001.png",
        const Color(0xFFEAA906),
      ),
      ShoeImage(
        "lib/screens/nikeConcept/assets/J_002.png",
        const Color(0xFF08B894),
      ),
      ShoeImage(
        "lib/screens/nikeConcept/assets/J_003.png",
        const Color(0xFFB50D0D),
      ),
      ShoeImage(
        "lib/screens/nikeConcept/assets/J_004.png",
        const Color(0xFF229954),
      ),
    ],
  ),
  Shoe(
    "NIKE BLAZER MID",
    "NIKE AIR",
    "₹12000",
    3,
    [
      ShoeImage(
        "lib/screens/nikeConcept/assets/Z_001.png",
        const Color(0xFF08B894),
      ),
      ShoeImage(
        "lib/screens/nikeConcept/assets/Z_002.png",
        const Color(0xFFE90311),
      ),
      ShoeImage(
        "lib/screens/nikeConcept/assets/Z_003.png",
        const Color(0xFF189E03),
      ),
      ShoeImage(
        "lib/screens/nikeConcept/assets/Z_004.png",
        const Color(0xFFF76A02),
      ),
    ],
  ),
  Shoe(
    "ZOOM VAPORFLY",
    "NIKE ZOOM",
    "₹15000",
    4,
    [
      ShoeImage(
        "lib/screens/nikeConcept/assets/N_001.png",
        const Color(0xFF7B7A41),
      ),
      ShoeImage(
        "lib/screens/nikeConcept/assets/N_002.png",
        const Color(0xFF2C2C46),
      ),
      ShoeImage(
        "lib/screens/nikeConcept/assets/N_003.png",
        const Color(0xFF262626),
      ),
      ShoeImage(
        "lib/screens/nikeConcept/assets/N_004.png",
        const Color(0xFF5C9462),
      ),
    ],
  ),
];
