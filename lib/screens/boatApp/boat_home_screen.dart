import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './boat_details_screen.dart';
import './models/boat.dart';

class BoatHomeScreen extends StatefulWidget {
  const BoatHomeScreen({Key? key}) : super(key: key);

  @override
  State<BoatHomeScreen> createState() => _BoatHomeScreenState();
}

class _BoatHomeScreenState extends State<BoatHomeScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();

  late final AnimationController _animationController;

  final ValueNotifier<double> _pageNotifier = ValueNotifier<double>(0.0);

  double _currentAppBarPosition = 40.0;

  @override
  void initState() {
    _pageController.addListener(_pageListener);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageListener);
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _pageListener() {
    _pageNotifier.value = _pageController.page!;
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            top: _currentAppBarPosition,
            width: _size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Boats",
                    style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    CupertinoIcons.search,
                    size: 36,
                  ),
                ],
              ),
            ),
          ),
          PageView.builder(
            controller: _pageController,
            physics: const BouncingScrollPhysics(),
            itemCount: boats.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: kToolbarHeight + 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, snapshot) {
                          /* return Hero(
                                tag: boats[index].title,
                                child: Transform(
                                  transform: Matrix4.identity()
                                    ..setEntry(3, 2, 0.001)
                                    ..rotateZ(
                                        -pi / 2 * _animationController.value),
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    boats[index].image,
                                    height: _size.height * 0.6,
                                  ),
                                ),
                              ); */
                          return Hero(
                            tag: boats[index].title,
                            child: Image.asset(
                              boats[index].image,
                              height: _size.height * 0.6,
                            ),
                          );
                        }),
                    const SizedBox(height: 20),
                    Text(
                      boats[index].title,
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: "By ",
                        style: const TextStyle(
                          fontSize: 24.0,
                          color: Colors.grey,
                        ),
                        children: [
                          TextSpan(
                            text: boats[index].designer,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.indigo,
                        elevation: 0,
                        padding: const EdgeInsets.all(0.0),
                      ),
                      onPressed: () async {
                        _animationController.forward();
                        /* Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BoatDetailsScreen(boat: boats[index]),
                          ),
                        ); */
                        setState(() {
                          _currentAppBarPosition = -50.0;
                        });

                        await Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return FadeTransition(
                                opacity: animation,
                                child: BoatDetailsScreen(boat: boats[index]),
                              );
                            },
                          ),
                        );

                        setState(() {
                          _currentAppBarPosition = 40.0;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            "SPEC",
                            style: TextStyle(
                              fontSize: 24.0,
                            ),
                          ),
                          Icon(CupertinoIcons.forward),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
