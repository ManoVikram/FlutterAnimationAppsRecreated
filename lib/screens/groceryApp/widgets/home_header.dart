import 'package:flutter/material.dart';

import '../constants.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Good Morning",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.grey[400],
                    ),
              ),
              Text(
                "Mano Vikram",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.grey[400]),
              ),
            ],
          ),
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/profile.png"),
          ),
        ],
      ),
    );
  }
}
