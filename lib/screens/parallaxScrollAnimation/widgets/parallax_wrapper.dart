import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ParallaxWrapper extends StatelessWidget {
  const ParallaxWrapper({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Consumer<ScrollController>(
      builder: (context, value, child) {
        final Size deviceHeight = MediaQuery.of(context).size;

        final RenderBox? renderObject =
            context.findRenderObject() as RenderBox?;
        final double? offsetY =
            renderObject?.localToGlobal(Offset.zero).dy ?? 0;

        final double percentOfWidgetVisible = (offsetY! / deviceHeight.height).clamp(0.0, 1.0);

        return Container(
          height: 200.0,
          width: 200.0,
          margin: const EdgeInsets.all(20.0),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: Colors.green,
              width: 5.0,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              image,
              alignment: Alignment(0.0, percentOfWidgetVisible - 0.6),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}