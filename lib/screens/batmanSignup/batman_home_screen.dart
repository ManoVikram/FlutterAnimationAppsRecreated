import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './widgets/batman_auth_buttons.dart';
import './widgets/batman_title.dart';
import './widgets/batman_city.dart';
import 'widgets/batman_auth.dart';

class BatmanHomeScreen extends StatefulWidget {
  const BatmanHomeScreen({Key? key}) : super(key: key);

  @override
  State<BatmanHomeScreen> createState() => _BatmanHomeScreenState();
}

class _BatmanHomeScreenState extends State<BatmanHomeScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _logoZoomOutAnimation;
  late final Animation<double> _logoTranslateAnimation;
  late final Animation<double> _batmanZoomOutAnimation;
  late final Animation<double> _buttonZoomInAnimation;

  late final AnimationController _animationControllerSignup;
  late final Animation<double> _logoFadeOutAnimation;
  late final Animation<double> _batmanMoveUpAnimation;
  late final Animation<double> _batmanCityAnimation;
  late final Animation<double> _authenticationAnimation;

  @override
  void initState() {
    super.initState();
    //! First app opening animation
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _logoZoomOutAnimation = Tween<double>(
      begin: 30.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.25),
      ),
    );

    _logoTranslateAnimation = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.35, 0.55),
    );

    _batmanZoomOutAnimation = Tween<double>(
      begin: 5.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.6,
          1.0,
          curve: Curves.decelerate,
        ),
      ),
    );

    _buttonZoomInAnimation = Tween<double>(
      begin: 270.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.6, 0.9),
      ),
    );

    /* _animation = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.25),
    ); */

    _animationController.forward();

    //! Animation after clicking on the button
    _animationControllerSignup = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    );

    _logoFadeOutAnimation = CurvedAnimation(
      parent: _animationControllerSignup,
      curve: const Interval(0.0, 0.1),
    );

    _batmanMoveUpAnimation = CurvedAnimation(
      parent: _animationControllerSignup,
      curve: const Interval(0.25, 0.35),
    );

    _batmanCityAnimation = CurvedAnimation(
      parent: _animationControllerSignup,
      curve: const Interval(0.3, 0.45),
    );

    _authenticationAnimation = CurvedAnimation(
      parent: _animationControllerSignup,
      curve: const Interval(
        0.6,
        0.8,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationControllerSignup.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Theme(
      data: ThemeData.light()
          .copyWith(textTheme: GoogleFonts.vidalokaTextTheme()),
      child: GestureDetector(
        onTap: () {
          _animationController.forward(from: 0.0);
          _animationControllerSignup.reverse();
        },
        child: AnimatedBuilder(
          animation: Listenable.merge(
              [_animationController, _animationControllerSignup]),
          builder: (context, child) {
            print(_logoTranslateAnimation.value);
            return Scaffold(
              backgroundColor: const Color(0xFF100F0B),
              body: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      "lib/screens/batmanSignup/assets/batman_background.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Transform.translate(
                      offset: Offset(
                          0.0,
                          40.0 * _logoFadeOutAnimation.value +
                              40 * -_batmanMoveUpAnimation.value),
                      child: Transform.scale(
                        alignment: Alignment.center,
                        scale: _batmanZoomOutAnimation.value,
                        child: Image.asset(
                          "lib/screens/batmanSignup/assets/batman_alone.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: _size.height * 0.28,
                    left: 40,
                    right: 40,
                    child: BatmanCity(animation: _batmanCityAnimation),
                  ),
                  Positioned(
                    top: _size.height * 0.55,
                    left: 0,
                    right: 0,
                    bottom:
                        0, //* This bottom makes the textfields and button scrollable
                    child: BatmanAuth(
                      authenticationAnimation: _authenticationAnimation,
                    ),
                  ),
                  Positioned(
                    top: _size.height * 0.5,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Transform.translate(
                          offset:
                              Offset(0.0, 70.0 * _logoFadeOutAnimation.value),
                          child: Opacity(
                            opacity: (1 - _logoFadeOutAnimation.value),
                            child: BatmanTitle(
                                logoTranslateAnimation:
                                    _logoTranslateAnimation),
                          ),
                        ),
                        const SizedBox(height: 40.0),
                        Transform.translate(
                          offset:
                              Offset(0.0, 120.0 * _logoFadeOutAnimation.value),
                          child: Opacity(
                            opacity: (1 - _logoFadeOutAnimation.value),
                            child: BatmanAuthButtons(
                              buttonZoomInAnimation: _buttonZoomInAnimation,
                              onTap: () {
                                _animationControllerSignup.forward();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: _size.height * 0.475 -
                        100 * _logoTranslateAnimation.value,
                    left: 0,
                    right: 0,
                    child: Opacity(
                      opacity: (1 - _logoFadeOutAnimation.value),
                      child: Transform.scale(
                        scale: _logoZoomOutAnimation.value,
                        child: Image.asset(
                          "lib/screens/batmanSignup/assets/batman_logo.png",
                          height: 80,
                          width: 100,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class BatmanButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool left;

  const BatmanButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.left = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Container(
          color: const Color(0xFFFDE86A),
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 36.0,
            child: Stack(
              children: [
                if (left)
                  Transform(
                    transform: Matrix4.identity()
                      ..translate(-20.0)
                      ..rotateZ(45),
                    alignment: Alignment.center,
                    child: Image.asset(
                      "lib/screens/batmanSignup/assets/batman_logo.png",
                      height: 32.0,
                      fit: BoxFit.contain,
                      color: const Color(0xFFC88853),
                    ),
                  ),
                Center(
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (!left)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Transform(
                      transform: Matrix4.identity()
                        ..translate(20.0)
                        ..rotateZ(-45),
                      alignment: Alignment.center,
                      child: Image.asset(
                        "lib/screens/batmanSignup/assets/batman_logo.png",
                        height: 32.0,
                        fit: BoxFit.contain,
                        color: const Color(0xFFC88853),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
