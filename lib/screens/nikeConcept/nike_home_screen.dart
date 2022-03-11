import 'package:flutter/material.dart';

import './shoe_details_screen.dart';
import './models/data.dart';
import './widgets/custom_bottom_bar.dart';
import './widgets/custom_app_bar.dart';

class NikeHomeScreen extends StatefulWidget {
  const NikeHomeScreen({Key? key}) : super(key: key);

  @override
  State<NikeHomeScreen> createState() => _NikeHomeScreenState();
}

class _NikeHomeScreenState extends State<NikeHomeScreen> {
  final PageController _pageController = PageController();

  double _currentPage = 0.0;
  double _indexPage = 0.0;

  void _pageListener() {
    setState(() {
      _currentPage = _pageController.page!;

      if (_currentPage >= 0 && _currentPage < 0.7) {
        _indexPage = 0.0;
      } else if (_currentPage > 0.7 && _currentPage < 1.7) {
        _indexPage = 1.0;
      } else if (_currentPage > 1.7 && _currentPage < 2.7) {
        _indexPage = 2.0;
      }
    });
  }

  Color getColor() {
    late final Color color;

    if (_currentPage >= 0 && _currentPage < 0.7) {
      color = shoes[0].imagesList[0].color;
    } else if (_currentPage > 0.7 && _currentPage < 1.7) {
      color = shoes[1].imagesList[0].color;
    } else if (_currentPage > 1.7 && _currentPage < 2.7) {
      color = shoes[2].imagesList[0].color;
    }

    return color;
  }

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_pageListener);
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageListener);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppBar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: List.generate(
                  categories.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: index == 0 ? getColor() : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 13),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                physics: const BouncingScrollPhysics(),
                itemCount: shoes.length,
                itemBuilder: (context, index) {
                  final List<String> categories =
                      shoes[index].category.split(" ");

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 350),
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  FadeTransition(
                            opacity: animation,
                            child: ShoeDetailsScreen(shoe: shoes[index]),
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: index == _indexPage ? 30.0 : 60.0,
                        left: 16,
                      ),
                      child: Transform.translate(
                        offset: Offset(index == _indexPage ? 0 : 20, 0),
                        child: LayoutBuilder(
                          builder: (context, constraints) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: EdgeInsets.only(
                                top: index == _indexPage ? 0 : 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(36),
                              color: Colors.white,
                            ),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                    vertical: 40.0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        shoes[index].category,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        shoes[index].name,
                                        style: const TextStyle(
                                          fontSize: 28.0,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        shoes[index].price,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      FittedBox(
                                        child: Text(
                                          "${categories[0]} \n ${categories[1]}",
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: constraints.maxHeight * 0.2,
                                  bottom: constraints.maxHeight * 0.2,
                                  left: constraints.maxWidth * 0.05,
                                  right: -constraints.maxWidth * 0.16,
                                  child: Hero(
                                    tag: shoes[index].name,
                                    child: Image(
                                      image: AssetImage(
                                        shoes[index].imagesList[0].image,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Material(
                                    color: shoes[index].imagesList[0].color,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(36),
                                      bottomRight: Radius.circular(36),
                                    ),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: InkWell(
                                      onTap: () {},
                                      child: const SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: Icon(
                                          Icons.add,
                                          size: 40,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 120,
              padding: const EdgeInsets.all(20.0),
              child: CustomBottomBar(color: getColor()),
            ),
          ],
        ),
      ),
    );
  }
}
