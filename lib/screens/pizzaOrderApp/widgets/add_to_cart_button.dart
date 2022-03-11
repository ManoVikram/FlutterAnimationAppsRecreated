import 'package:flutter/material.dart';

class AddToCartButton extends StatefulWidget {
  final VoidCallback onTap;

  const AddToCartButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 1.0,
      upperBound: 1.5,
      duration: const Duration(milliseconds: 100),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        widget.onTap;

        await _animationController.forward(from: 0.0);
        await _animationController.reverse(from: 0.7);
      },
      child: AnimatedBuilder(
        animation: _animationController,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 247, 203, 138),
                Colors.orange,
              ],
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5.0,
                offset: Offset(0.0, 4.0),
                spreadRadius: 3.0,
              ),
            ],
          ),
          child: const Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
            size: 36.0,
          ),
        ),
        builder: (context, child) {
          return Transform.scale(
            // scale: (1 - Curves.easeOut.transform(_animationController.value))
            //     .clamp(0.7, 1.0),
            scale: 2 - _animationController.value,
            child: child!,
          );
        },
      ),
    );
  }
}