import 'package:flutter/material.dart';

class PizzaSizeButton extends StatelessWidget {
  final bool isSelected;
  final String text;
  final VoidCallback onTap;

  const PizzaSizeButton({
    Key? key,
    required this.isSelected,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: isSelected
                ? [
                    const BoxShadow(
                      blurRadius: 10.0,
                      color: Colors.black12,
                      offset: Offset(0.3, 0.5),
                      spreadRadius: 5.0,
                    ),
                  ]
                : null,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.brown,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}