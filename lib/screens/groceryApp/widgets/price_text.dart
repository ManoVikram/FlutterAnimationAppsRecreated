import 'package:flutter/material.dart';

import '../constants.dart';

class PriceText extends StatelessWidget {
  const PriceText({
    Key? key,
    required this.price,
  }) : super(key: key);

  final String price;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "\$ ",
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
              color: primaryColor,
              fontWeight: FontWeight.w600,
            ),
        children: [
          TextSpan(
            text: price,
            style: const TextStyle(color: Colors.black),
          ),
          const TextSpan(
            text: "/kg",
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
