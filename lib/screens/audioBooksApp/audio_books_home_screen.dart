import 'dart:math';

import 'package:flutter/material.dart';

import './models/book.dart';

class AudioBooksHomeScreen extends StatefulWidget {
  const AudioBooksHomeScreen({Key? key}) : super(key: key);

  @override
  State<AudioBooksHomeScreen> createState() => _AudioBooksHomeScreenState();
}

class _AudioBooksHomeScreenState extends State<AudioBooksHomeScreen> {
  final PageController _pageController = PageController();

  final ValueNotifier<double> _scrollNotifier = ValueNotifier<double>(0.0);

  @override
  void initState() {
    super.initState();
    _pageController.addListener(pageListener);
  }

  @override
  void dispose() {
    _pageController.removeListener(pageListener);
    _pageController.dispose();
    super.dispose();
  }

  void pageListener() {
    print(_pageController.page);
    _scrollNotifier.value = _pageController.page!;
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "lib/screens/audioBooksApp/assets/background.png",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: kToolbarHeight,
            child: AppBar(
              title: const Text(
                "Audio Books",
                style: TextStyle(color: Colors.black),
              ),
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: Colors.white,
            ),
          ),
          ValueListenableBuilder<double>(
            valueListenable: _scrollNotifier,
            builder: (context, value, child) {
              return PageView.builder(
                controller: _pageController,
                physics: const BouncingScrollPhysics(),
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final num rotationValue =
                      pow((index - value).clamp(0.0, 1.0), 0.5);
                  // final double rotationValue = (index - value).clamp(0.0, 1.0);

                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Stack(
                            children: [
                              Container(
                                height: _size.height * 0.45,
                                width: _size.width * 0.6,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(10.0, 5.0),
                                      blurRadius: 20.0,
                                      spreadRadius: 5.0,
                                    ),
                                  ],
                                ),
                              ),
                              Transform(
                                transform: Matrix4.identity()
                                  ..setEntry(3, 2, 0.001)
                                  ..rotateY(1.8 * rotationValue)
                                  ..translate(
                                      -rotationValue * _size.width * 0.6)
                                  ..scale(rotationValue + 1),
                                alignment: Alignment.centerLeft,
                                child: Image.asset(
                                  books[index].coverImage,
                                  fit: BoxFit.fill,
                                  height: _size.height * 0.45,
                                  width: _size.width * 0.6,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        Opacity(
                          opacity: 1 - rotationValue.toDouble(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                books[index].title,
                                style: const TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              Text(
                                "By ${books[index].author}",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 24.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
