import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer({
    Key? key,
    required Size size,
    required this.answerText,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final String answerText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _size.width * 0.7,
      child: Text(
        answerText,
        overflow: TextOverflow.clip,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}