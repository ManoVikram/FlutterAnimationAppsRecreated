import 'package:flutter/material.dart';

class QuestionText extends StatelessWidget {
  const QuestionText({
    Key? key,
    required Size size,
    required this.text,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 30.0),
        SizedBox(
          width: _size.width * 0.72,
          child: Text(
            text,
            overflow: TextOverflow.clip,
            maxLines: 3,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}