import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final VoidCallback? onTap;
  final double height;
  final double width;
  final Widget child;

  const CustomButton({
    Key? key,
    this.borderRadius,
    this.margin,
    this.padding,
    this.color,
    this.onTap,
    this.height = 50.0,
    this.width = 50.0,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? Colors.white,
      borderRadius: borderRadius ?? BorderRadius.circular(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: height,
          width: width,
          margin: margin,
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
