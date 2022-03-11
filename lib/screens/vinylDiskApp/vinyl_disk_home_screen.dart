import 'dart:math';

import 'package:flutter/material.dart';

class VinylDiskHomeScreen extends StatefulWidget {
  const VinylDiskHomeScreen({Key? key}) : super(key: key);

  @override
  State<VinylDiskHomeScreen> createState() => _VinylDiskHomeScreenState();
}

class _VinylDiskHomeScreenState extends State<VinylDiskHomeScreen> {
  final ScrollController _sliverScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            controller: _sliverScrollController,
            slivers: [
              SliverPersistentHeader(
                delegate: VinylDiskSliverHeader(),
                pinned: true,
              ),
              /* SliverAppBar(
                expandedHeight: _size.height * 0.4,
                collapsedHeight: _size.height * 0.15,
                backgroundColor: Colors.grey[100],
                elevation: 0,
                leading: Container(),
                pinned: true,
                primary: true,
                // stretch: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Stack(
                    fit: StackFit.expand,
                    children: [
                      Positioned(
                        bottom:0,
                        left: 0,
                        height: _size.height * 0.13,
                        child: Image.asset(
                          "lib/screens/vinylDiskApp/assets/Blue_JB.jpg",
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ],
                  ),
                ),
              ), */
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    """Lorem ipsum dolor sit amet, consectetur adipiscing elit. In non semper turpis. Sed at dui venenatis nisl euismod egestas. Pellentesque at viverra mauris. Phasellus varius semper elit quis euismod. Proin tincidunt faucibus nulla, tempus condimentum orci auctor sit amet. Fusce a nunc tincidunt, ornare arcu non, consequat felis. Sed faucibus tristique tellus, in dictum nibh ornare posuere. Praesent vitae sagittis sapien, et tincidunt dolor. Maecenas faucibus tincidunt rhoncus.
        
        Sed arcu metus, consequat eget malesuada sit amet, lobortis a elit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla tristique, nisl in efficitur vulputate, nisi ligula vestibulum eros, eget imperdiet massa nunc a leo. Aenean facilisis sit amet quam at pulvinar. Etiam eleifend pretium lorem, in cursus est molestie sit amet. Nullam semper arcu eu nisi aliquam viverra. Morbi risus leo, vehicula at tempus quis, ultrices et justo. Curabitur congue velit urna, volutpat volutpat sem viverra ut. Vestibulum et venenatis ligula. Nunc congue mi id sapien venenatis, pulvinar posuere ligula gravida. Integer a consectetur arcu. Sed ultricies in nisl ac accumsan. Aenean blandit ipsum ante, dictum maximus lectus tincidunt ut. Aenean lacus sem, lacinia eu tincidunt et, commodo eu eros.
        
        Ut fermentum urna eget mauris fringilla pretium. Curabitur egestas cursus leo, sed efficitur mauris sollicitudin et. Nulla bibendum semper mi non tempus. Duis sit amet ullamcorper nisl, ac tincidunt ipsum. Mauris pharetra lectus in condimentum convallis. Sed sagittis, enim vel ornare lacinia, elit nulla tincidunt ante, eu fringilla turpis est et tortor. Ut non turpis id mi egestas fringilla in sed turpis. Suspendisse ultrices elit dui, eu sagittis mauris lobortis ac.
        
        Aenean et odio sed lectus aliquet lobortis at at libero. In at iaculis arcu. Fusce tortor risus, dapibus sit amet nunc a, tempus cursus velit. Nullam fringilla et mi et volutpat. Nunc et nisl odio. Duis porta, turpis ac efficitur ultrices, libero neque laoreet nunc, vitae viverra mauris diam quis risus. Nulla facilisi. Cras id metus vitae felis placerat vulputate. Nulla et egestas nisl.""",
                    style: TextStyle(fontSize: 20),
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

const double _maxHeaderHeight = 360.0;
const double _minHeaderHeight = 100.0;

const double _maxImageHeight = 170.0;
const double _minImageHeight = 70.0;

const double _maxTitlePositionFromTop = 50;
const double _minTitlePositionFromTop = 30;

const double _maxHeaderTitleSize = 40.0;
const double _maxSubTitleSize = 20.0;

const double _minHeaderTitleSize = 26.0;
const double _minSubTitleSize = 16.0;

const double _vinylDiskPositionFromLeft = 180.0;

const double _maxImagePositionFromLeft = 60.0;
const double _minImagePositionFromLeft = 30.0;

class VinylDiskSliverHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final Size _size = MediaQuery.of(context).size;

    final double _headerPercent = shrinkOffset / _maxHeaderHeight;

    final double _imagePercent = (_maxImageHeight * (1 - _headerPercent))
        .clamp(_minImageHeight, _maxImageHeight);

    final double _vinylDiksPositionPercent =
        (_vinylDiskPositionFromLeft * (1 - _headerPercent))
            .clamp(_minImagePositionFromLeft, _vinylDiskPositionFromLeft);

    final double _imagePositionPercent =
        (_maxImagePositionFromLeft * (1 - _headerPercent))
            .clamp(_minImagePositionFromLeft, _maxImagePositionFromLeft);

    final double _titlePositionPercent =
        (_maxTitlePositionFromTop * (1 - _headerPercent))
            .clamp(_minTitlePositionFromTop, _maxTitlePositionFromTop);

    final double _titleSizePercent =
        (_maxHeaderTitleSize * (1 - _headerPercent))
            .clamp(_minHeaderTitleSize, _maxHeaderTitleSize);

    final double _subTitleSizePercent =
        (_maxSubTitleSize * (1 - _headerPercent))
            .clamp(_minSubTitleSize, _maxSubTitleSize);

    return Container(
      color: Colors.grey[100],
      child: Stack(
        children: [
          Positioned(
            top: _titlePositionPercent,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Blue",
                  style: TextStyle(
                    fontSize: _titleSizePercent,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  "Jonas Blue",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: _subTitleSizePercent,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 15,
            left: _vinylDiksPositionPercent,
            height: _imagePercent,
            child: Transform.rotate(
              angle: pi * _headerPercent * 2,
              child: Image.asset(
                "lib/screens/vinylDiskApp/assets/VinylDisk.png",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            left: _imagePositionPercent,
            height: _imagePercent,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                "lib/screens/vinylDiskApp/assets/Blue_JB.jpg",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => _maxHeaderHeight;

  @override
  double get minExtent => _minHeaderHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;

  /* @override
  OverScrollHeaderStretchConfiguration? get stretchConfiguration =>
      OverScrollHeaderStretchConfiguration(stretchTriggerOffset: 100.0); */
}
