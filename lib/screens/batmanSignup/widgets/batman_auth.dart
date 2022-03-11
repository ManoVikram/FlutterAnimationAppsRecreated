import 'package:flutter/material.dart';

import '../batman_home_screen.dart';

class BatmanAuth extends AnimatedWidget {
  final Animation authenticationAnimation;

  const BatmanAuth({
    Key? key,
    required this.authenticationAnimation,
  }) : super(key: key, listenable: authenticationAnimation);

  Animation get _authenticationAnimation => listenable as Animation;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Opacity(
          opacity: authenticationAnimation.value.clamp(0.0, 1.0),
          child: Transform.translate(
            offset: Offset(
                0.0, 100 * (1 - authenticationAnimation.value).toDouble()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "GET ACCESS",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20.0),
                const TextField(
                  decoration: InputDecoration(
                    labelText: "Username",
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.5,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: const TextStyle(color: Colors.white),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.5,
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.5,
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: UnconstrainedBox(
                        child: Image.asset(
                          "lib/screens/batmanSignup/assets/batman_logo.png",
                          height: 15,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                BatmanButton(
                  onTap: () {},
                  text: "SIGNUP",
                  left: false,
                ),
                const SizedBox(height: 20.0),
                BatmanButton(
                  onTap: () {},
                  text: "SIGNUP",
                  left: false,
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
