import 'package:flutter/material.dart';
import 'package:learning_flutter_animations/screens/animatedAuthentication/constants.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.15),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Email",
                hintStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.white38,
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(defaultPadding),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.white38,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(defaultPadding),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Forgot Password?",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
