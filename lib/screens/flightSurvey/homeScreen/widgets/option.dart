import 'package:flutter/material.dart';

import './answer.dart';
import './dot.dart';

class Option extends StatelessWidget {
  const Option({
    Key? key,
    required Size size,
    required this.answer,
    required this.onTap,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final String answer;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          const Dot(),
          const SizedBox(width: 24.0),
          Answer(
            size: _size,
            answerText: answer,
          ),
        ],
      ),
    );
  }
}