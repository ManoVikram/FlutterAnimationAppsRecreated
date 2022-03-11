import 'package:flutter/material.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: Image.asset("lib/screens/animatedAuthentication/assets/fb.png"),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(
              "lib/screens/animatedAuthentication/assets/linkedin.png"),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(
              "lib/screens/animatedAuthentication/assets/twitter.png"),
        ),
      ],
    );
  }
}
