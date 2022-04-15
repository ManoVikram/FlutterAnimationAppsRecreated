import 'package:flutter/material.dart';

class QuestionNumber extends StatelessWidget {
  const QuestionNumber({
    Key? key,
    required this.questionNumber,
  }) : super(key: key);

  final String questionNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 30.0),
        Text(
          questionNumber,
          style: const TextStyle(
            color: Colors.white60,
            fontSize: 72.0,
          ),
        ),
      ],
    );
  }
}