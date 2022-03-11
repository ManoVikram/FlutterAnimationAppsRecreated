import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MyButton({
    Key? key,
    required this.size,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        fixedSize: Size(size.width / 2, 70),
        side: const BorderSide(
          color: Colors.amber,
        ),
        onSurface: Colors.black,
        padding: const EdgeInsets.all(10),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
