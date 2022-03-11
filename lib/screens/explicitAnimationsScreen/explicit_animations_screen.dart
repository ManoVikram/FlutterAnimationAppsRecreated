import 'package:flutter/material.dart';

class ExplicitAnimationsScreen extends StatefulWidget {
  const ExplicitAnimationsScreen({Key? key}) : super(key: key);

  @override
  _ExplicitAnimationsScreenState createState() =>
      _ExplicitAnimationsScreenState();
}

class _ExplicitAnimationsScreenState extends State<ExplicitAnimationsScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final ReverseAnimation _reverse;
  late final Animation<Alignment> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });

    _reverse = ReverseAnimation(_animationController);

    _animation = Tween<Alignment>(
      begin: Alignment.bottomCenter,
      end: Alignment.topRight,
    ).animate(_animationController);
/*       ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      }); */

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        /* child: RotationTransition(
          turns: _reverse,
          child: const FlutterLogo(size: 200),
        ), */
        /*  child: SlideTransition(
          position: _animation,
          child: const FlutterLogo(
            size: 200,
          ),
        ), */
        /* child: FadeTransition(
          opacity: _animationController,
          child: const FlutterLogo(
            size: 200,
          ),
        ), */
        /*  child: SizeTransition(
          sizeFactor: _animationController,
          child: const FlutterLogo(
            size: 200,
          ),
        ), */
        child: AlignTransition(
          alignment: _animation,
          child: const FlutterLogo(
            size: 200,
          ),
        ),
      ),
    );
  }
}
