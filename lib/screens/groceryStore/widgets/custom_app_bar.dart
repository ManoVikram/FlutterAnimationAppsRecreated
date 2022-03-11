import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      color: Colors.grey[50],
      child: Row(
        children: [
          const BackButton(color: Colors.black),
          const SizedBox(width: 10.0),
          const Expanded(
            child: Text(
              "Fruits and Vegetables",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_alt_rounded),
          ),
        ],
      ),
    );
  }
}
