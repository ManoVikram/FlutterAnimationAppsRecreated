import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScrollImageWrapper extends StatelessWidget {
  const ScrollImageWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Consumer<ScrollController>(
      builder: (context, scrollController, child) {
        final RenderBox? renderObject =
            context.findRenderObject() as RenderBox?;
        final double offsetY =
            renderObject?.localToGlobal(Offset.zero).dy ?? 0.0;

        if (offsetY <= 0) {
          return child!;
        }

        final double deviceHeight = MediaQuery.of(context).size.height;
        final Size? sizeOfTheWidget = renderObject?.size;
        final double widgetVisibleHeight = deviceHeight - offsetY;

        final double percentOfWidgetVisible =
            (widgetVisibleHeight / sizeOfTheWidget!.height).clamp(0.0, 1.0);

        final double scalePercent = 0.8 + (percentOfWidgetVisible * 0.2);
        final double opacityPercent = 0.2 + (percentOfWidgetVisible * 0.8);

        return Transform.scale(
          scale: scalePercent,
          alignment: Alignment.center,
          child: Opacity(
            opacity: opacityPercent,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}