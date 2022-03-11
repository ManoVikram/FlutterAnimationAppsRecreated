import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

import './widgets/signup_form.dart';
import './widgets/login_form.dart';
import './widgets/social_buttons.dart';

import './constants.dart';

class AuthenticationHomeScreen extends StatefulWidget {
  const AuthenticationHomeScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationHomeScreen> createState() =>
      _AuthenticationHomeScreenState();
}

class _AuthenticationHomeScreenState extends State<AuthenticationHomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool _isShowSignUp = false;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: defaultDuration,
    );
    _animation = Tween<double>(begin: 0, end: 90).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void updateView() {
    setState(() {
      _isShowSignUp = !_isShowSignUp;
    });
    _isShowSignUp ? _controller.forward() : _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            children: [
              AnimatedPositioned(
                duration: defaultDuration,
                left: _isShowSignUp ? -_size.width * 0.71 : 0,
                height: _size.height,
                width: _size.width * 0.86,
                child: Container(
                  color: bgLogin,
                  child: const LoginForm(),
                ),
              ),
              AnimatedPositioned(
                duration: defaultDuration,
                height: _size.height,
                width: _size.width * 0.86,
                left: _isShowSignUp ? _size.width * 0.14 : _size.width * 0.86,
                child: Container(
                  color: bgSignup,
                  child: const SignUpForm(),
                ),
              ),
              AnimatedPositioned(
                duration: defaultDuration,
                top: _size.height * 0.1,
                left: 0,
                right: _isShowSignUp ? -_size.width * 0.07 : _size.width * 0.07,
                child: CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.white60,
                  child: AnimatedSwitcher(
                    duration: defaultDuration,
                    child: _isShowSignUp
                        ? SvgPicture.asset(
                            "lib/screens/animatedAuthentication/assets/animation_logo.svg",
                            color: bgSignup,
                          )
                        : SvgPicture.asset(
                            "lib/screens/animatedAuthentication/assets/animation_logo.svg",
                            color: bgLogin,
                          ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: defaultDuration,
                bottom: _size.height * 0.1,
                right: _isShowSignUp ? -_size.width * 0.07 : _size.width * 0.07,
                width: _size.width,
                child: const SocialButtons(),
              ),
              AnimatedPositioned(
                duration: defaultDuration,
                bottom:
                    _isShowSignUp ? _size.height / 2 - 100 : _size.height * 0.3,
                left: _isShowSignUp ? 0 : _size.width * 0.44 - 85,
                child: AnimatedDefaultTextStyle(
                  duration: defaultDuration,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: _isShowSignUp ? 20 : 32,
                    fontWeight: FontWeight.bold,
                    color: _isShowSignUp ? Colors.white : Colors.white70,
                  ),
                  child: Transform.rotate(
                    angle: -_animation.value * math.pi / 180,
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () {
                        if (_isShowSignUp) {
                          updateView();
                        } else {
                          // Login
                        }
                      },
                      child: Container(
                        width: 160,
                        padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding * 0.75),
                        child: Text(
                          "Log In".toUpperCase(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: defaultDuration,
                bottom: !_isShowSignUp
                    ? _size.height / 2 - 100
                    : _size.height * 0.3,
                right: _isShowSignUp ? _size.width * 0.44 - 85 : 0,
                child: AnimatedDefaultTextStyle(
                  duration: defaultDuration,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: !_isShowSignUp ? 20 : 32,
                    fontWeight: FontWeight.bold,
                    color: _isShowSignUp ? Colors.white : Colors.white70,
                  ),
                  child: Transform.rotate(
                    angle: (90 - _animation.value) * math.pi / 180,
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        if (_isShowSignUp) {
                          // SignUp
                        } else {
                          updateView();
                        }
                      },
                      child: Container(
                        width: 160,
                        padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding * 0.75),
                        child: Text(
                          "Sign Up".toUpperCase(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
