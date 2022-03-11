import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class MyHeader {
  final String? title;
  final bool? visible;

  const MyHeader(
    this.title,
    this.visible,
  );
}

class BankingHomeScreen extends StatefulWidget {
  const BankingHomeScreen({Key? key}) : super(key: key);

  @override
  State<BankingHomeScreen> createState() => _BankingHomeScreenState();
}

class _BankingHomeScreenState extends State<BankingHomeScreen> {
  final ValueNotifier<MyHeader?> headerValueNotifier =
      ValueNotifier<MyHeader?>(null);

  final ValueNotifier<double> scrollNotifier = ValueNotifier(0.0);

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScrollListen);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScrollListen);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScrollListen() {
    scrollNotifier.value = _scrollController.offset;
  }

  void updateHeader(String title, bool isVisible, {String? previousTitle}) {
    final MyHeader? currentHeaderTitleValue = headerValueNotifier.value;
    final String currentHeaderTitle = currentHeaderTitleValue?.title ?? title;
    final bool isHeaderVisible = currentHeaderTitleValue?.visible ?? false;

    Future.microtask(
      () {
        if (_scrollController.offset > 0 &&
            (currentHeaderTitle != title ||
                previousTitle == null ||
                isHeaderVisible != isVisible)) {
          if (!isVisible && previousTitle != null) {
            headerValueNotifier.value = MyHeader(previousTitle, true);
          } else {
            headerValueNotifier.value = MyHeader(title, isVisible);
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Stack(
            children: [
              CustomScrollView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  ValueListenableBuilder<double>(
                    valueListenable: scrollNotifier,
                    builder: (context, value, child) {
                      print(value);

                      final double? rotatePercent = lerpDouble(0.0, -pi / 2,
                          (value / (250.0 - kToolbarHeight)).clamp(0.0, 1.0));

                      final double? opacityPercent = lerpDouble(1.0, 0.0,
                          (value / (250.0 - kToolbarHeight)).clamp(0.0, 1.0));

                      return SliverAppBar(
                        automaticallyImplyLeading: false,
                        backgroundColor: Colors.transparent,
                        title: const Text(
                          "₹18,000",
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        expandedHeight: 250.0,
                        stretch: true,
                        flexibleSpace: FlexibleSpaceBar(
                          stretchModes: const [
                            StretchMode.blurBackground,
                          ],
                          background: Padding(
                            padding: const EdgeInsets.only(top: kToolbarHeight),
                            child: Center(
                              child: Opacity(
                                opacity: opacityPercent!,
                                child: Transform(
                                  transform: Matrix4.identity()
                                    ..setEntry(3, 2, 0.002)
                                    ..rotateX(rotatePercent!),
                                  alignment: Alignment.center,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    padding: const EdgeInsets.only(
                                        top: 20.0, left: 20.0),
                                    children: [
                                      Container(
                                        width: 150.0,
                                        color: Colors.redAccent,
                                      ),
                                      const SizedBox(width: 10.0),
                                      Container(
                                        width: 120.0,
                                        color: Colors.blueAccent,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  ...[
                    SliverPersistentHeader(
                      delegate: HeaderTitle(
                        title: "Latest Transaction",
                        onHeaderChanged: (visible) =>
                            updateHeader("April", visible),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return ListTile(
                            title: Text("Title: $index"),
                          );
                        },
                        childCount: 15,
                      ),
                    ),
                  ],
                  ...[
                    SliverPersistentHeader(
                      delegate: HeaderTitle(
                        title: "March",
                        onHeaderChanged: (visible) => updateHeader(
                          "March",
                          visible,
                          previousTitle: "April",
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return ListTile(
                            title: Text("Title: $index"),
                          );
                        },
                        childCount: 15,
                      ),
                    ),
                  ],
                ],
              ),
              ValueListenableBuilder<MyHeader?>(
                valueListenable: headerValueNotifier,
                builder: (context, value, child) {
                  final bool isVisible = value?.visible ?? false;
                  final String title = value?.title ?? "";

                  return Positioned(
                    top: 0,
                    left: 16,
                    right: 0,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      layoutBuilder: (currentChild, previousChildren) {
                        return Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            ...previousChildren,
                            if (currentChild != null) currentChild,
                          ],
                        );
                      },
                      transitionBuilder: (child, animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: SizeTransition(
                            sizeFactor: animation,
                            child: child,
                          ),
                        );
                      },
                      child: isVisible
                          ? DecoratedBox(
                              key: Key(title),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.7),
                              ),
                              child: Text(
                                title,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  );
                },
              ),
              const Positioned(
                top: 0,
                right: 16,
                child: CircleAvatar(
                  backgroundColor: Colors.black54,
                  child: Icon(
                    Icons.compare_arrows_sharp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderTitle extends SliverPersistentHeaderDelegate {
  final String title;
  final void Function(bool visible) onHeaderChanged;

  const HeaderTitle({
    required this.title,
    required this.onHeaderChanged,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    print(shrinkOffset);
    if (shrinkOffset > 0) {
      onHeaderChanged(true);
    } else {
      onHeaderChanged(false);
    }

    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 55.0;

  @override
  double get minExtent => 55.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
