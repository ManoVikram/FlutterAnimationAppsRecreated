import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavouriteButton extends StatelessWidget {
  final double radius;

  const FavouriteButton({
    Key? key,
    this.radius = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.grey[400],
      child: SvgPicture.asset("assets/icons/heart.svg"),
    );
  }
}
