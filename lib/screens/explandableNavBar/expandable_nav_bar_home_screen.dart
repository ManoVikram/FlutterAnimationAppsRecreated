import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './models/music.dart';

const double _expandedNavBarHeight = 350.0;
const double _closedNavBarHeight = 80.0;

class ExpandableNavBarHomeScreen extends StatefulWidget {
  const ExpandableNavBarHomeScreen({Key? key}) : super(key: key);

  @override
  State<ExpandableNavBarHomeScreen> createState() =>
      _ExpandableNavBarHomeScreenState();
}

class _ExpandableNavBarHomeScreenState extends State<ExpandableNavBarHomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  bool _isExpanded = false;

  double _currentHeight = _closedNavBarHeight;

  Music currentMusic = allMusic[0];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget minimizedNavBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Icon(
          Icons.view_carousel_rounded,
          color: Colors.white,
          size: 30,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = true;
              _currentHeight = _expandedNavBarHeight;
              _animationController.forward(from: 0.0);
            });
          },
          child: CircleAvatar(
            backgroundImage: AssetImage(currentMusic.songCover),
            radius: 30,
          ),
        ),
        CircleAvatar(
          backgroundImage: AssetImage(currentMusic.artistDP),
        ),
      ],
    );
  }

  Widget expandedNavBar() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  currentMusic.songCover,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              currentMusic.artistName,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 15),
            Text(
              currentMusic.songName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            // const Spacer(),
            const SizedBox(height: 30),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    CupertinoIcons.shuffle,
                    color: Colors.white,
                    size: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isExpanded = true;
                        _currentHeight = _expandedNavBarHeight;

                        _animationController.forward();
                      });
                    },
                    child: const Icon(
                      CupertinoIcons.pause,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const Icon(
                    Icons.playlist_add,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Material(
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    "Favourite Artist",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      const SizedBox(width: 16),
                      Container(
                        height: 100,
                        width: 100,
                        margin: const EdgeInsets.only(right: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            allMusic[0].artistDP,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        margin: const EdgeInsets.only(right: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            allMusic[1].artistDP,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        margin: const EdgeInsets.only(right: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            allMusic[2].artistDP,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        margin: const EdgeInsets.only(right: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            allMusic[3].artistDP,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    "Recently Played",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 0),
                  shrinkWrap: true,
                  itemCount: allMusic.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        currentMusic = allMusic[index];
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 16.0,
                      ),
                      child: LayoutBuilder(builder: (context, constraint) {
                        return Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Container(
                                height: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  // color: Colors.primaries[index % Colors.primaries.length],
                                  image: DecorationImage(
                                    image: AssetImage(
                                      allMusic[index].songCover,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 3.0,
                                    sigmaY: 3.0,
                                  ),
                                  child: Container(
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 20,
                              left: constraint.maxWidth / 2 - 45,
                              child: CircleAvatar(
                                radius: 45,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage(allMusic[index].artistDP),
                                  radius: 40.0,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 120,
                              left: 0,
                              right: 0,
                              child: Column(
                                children: [
                                  Text(
                                    allMusic[index].artistName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(
                                    allMusic[index].songName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3!
                                        .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
          extendBody: true,
          bottomNavigationBar: GestureDetector(
            /* onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
      
              if (_isExpanded) {
                _animationController.forward();
              } else {
                _animationController.reverse();
              }
            }, */
            onVerticalDragUpdate: _isExpanded
                ? (DragUpdateDetails details) {
                    setState(() {
                      final double newHeight =
                          _currentHeight - details.delta.dy;

                      _animationController.value =
                          _currentHeight / _expandedNavBarHeight;

                      _currentHeight = newHeight.clamp(
                          _closedNavBarHeight, _expandedNavBarHeight);
                    });
                  }
                : null,
            onVerticalDragEnd: _isExpanded
                ? (DragEndDetails details) {
                    if (_currentHeight < _expandedNavBarHeight / 1.5) {
                      _animationController.reverse();

                      _isExpanded = false;
                    } else {
                      _isExpanded = true;

                      _animationController.forward(
                          from: _currentHeight / _expandedNavBarHeight);

                      _currentHeight = _expandedNavBarHeight;
                    }
                  }
                : null,
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, _) {
                final double value = const ElasticInOutCurve(0.7)
                    .transform(_animationController.value);

                return Stack(
                  children: [
                    Positioned(
                      left: lerpDouble(
                        _size.width / 2 - (_size.width * 0.6) / 2,
                        0.0,
                        value,
                      ),
                      bottom: lerpDouble(
                        30.0,
                        0.0,
                        value,
                      ),
                      child: Container(
                        height: lerpDouble(
                          _closedNavBarHeight,
                          _currentHeight,
                          value,
                        ),
                        width: lerpDouble(
                          _size.width * 0.6,
                          _size.width,
                          value,
                        ),
                        clipBehavior: Clip.antiAlias,
                        // padding: const EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 53, 76, 209),
                          borderRadius: BorderRadius.vertical(
                            top: const Radius.circular(30.0),
                            bottom: Radius.circular(
                              lerpDouble(
                                30.0,
                                0.0,
                                value,
                              )!,
                            ),
                          ),
                        ),
                        child: _isExpanded
                            ? Opacity(
                                opacity: _animationController.value,
                                child: expandedNavBar(),
                              )
                            : minimizedNavBar(),
                      ),
                    ),
                    /* Positioned(
                      height: _closedNavBarHeight,
                      left: _size.width / 2 - (_size.width * 0.6) / 2,
                      bottom: 50.0,
                      width: _size.width * 0.6,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const ClosedNavBar(),
                        ),
                      ),
                    ), */
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
