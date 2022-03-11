import 'package:flutter/material.dart';

import './models/skin.dart';

class DbrandHomeScreen extends StatefulWidget {
  const DbrandHomeScreen({Key? key}) : super(key: key);

  @override
  State<DbrandHomeScreen> createState() => _DbrandHomeScreenState();
}

class _DbrandHomeScreenState extends State<DbrandHomeScreen>
    with SingleTickerProviderStateMixin {
  Skin _currentSkin = allSkins.first;
  Skin _previousSkin = allSkins[1];

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
      upperBound: 4.0,
    )..forward(from: 0.1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: const Text("DBrand Pop Skins"),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  _previousSkin.image,
                  fit: BoxFit.cover,
                ),
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return ClipPath(
                      clipper: MySkinClipper(
                        value: _animationController.value,
                        alignment: _currentSkin.alignment,
                      ),
                      child: Image.asset(
                        _currentSkin.image,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                _currentSkin.colorName,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 30.0,
                childAspectRatio: 2.5,
              ),
              itemCount: allSkins.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    _animationController.forward(from: 0.0).whenComplete(() {
                      setState(() {
                        _previousSkin = _currentSkin;
                      });
                    });

                    setState(() {
                      _currentSkin = allSkins[index];
                    });
                  },
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: allSkins[index].color,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MySkinClipper extends CustomClipper<Path> {
  final double value;
  final Alignment alignment;

  MySkinClipper({
    required this.value,
    required this.alignment,
  });

  @override
  Path getClip(Size size) {
    var path = Path();

    Offset? centerOffset = Offset(size.width / 2, size.height / 2);

    if (alignment == Alignment.center) {
      centerOffset = Offset(size.width / 2, size.height / 2);
    } else if (alignment == Alignment.bottomCenter) {
      centerOffset = Offset(size.width / 2, size.height);
    } else if (alignment == Alignment.bottomLeft) {
      centerOffset = Offset(0, size.height);
    } else if (alignment == Alignment.bottomRight) {
      centerOffset = Offset(size.width, size.height);
    } else if (alignment == Alignment.centerLeft) {
      centerOffset = Offset(0, size.height / 2);
    } else if (alignment == Alignment.centerRight) {
      centerOffset = Offset(size.width, size.height / 2);
    } else if (alignment == Alignment.topCenter) {
      centerOffset = Offset(size.width / 2, 0);
    } else if (alignment == Alignment.topLeft) {
      centerOffset = const Offset(0, 0);
    }

    path.addOval(
      Rect.fromCenter(
        center: centerOffset,
        width: size.width * value,
        height: size.height * value,
      ),
    );

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class DBrandSkins extends StatelessWidget {
  const DBrandSkins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}
