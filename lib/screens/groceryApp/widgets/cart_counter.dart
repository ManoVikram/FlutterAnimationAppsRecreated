import 'package:flutter/material.dart';

import '../constants.dart';

class CartCounter extends StatelessWidget {
  const CartCounter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              elevation: 0,
              primary: Colors.white,
              fixedSize: const Size(36, 36),
            ),
            child: const Icon(
              Icons.remove,
              color: Colors.grey,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            child: Text(
              "1",
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              elevation: 0,
              primary: Colors.white,
              fixedSize: const Size(36, 36),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}