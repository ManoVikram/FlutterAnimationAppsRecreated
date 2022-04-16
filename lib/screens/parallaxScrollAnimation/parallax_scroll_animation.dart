import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './widgets/parallax_wrapper.dart';

class ParallxScrollAnimation extends StatelessWidget {
  ParallxScrollAnimation({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider.value(
          value: _scrollController,
          builder: (context, child) {
            return ListView.builder(
              controller: _scrollController,
              itemCount: 10,
              itemBuilder: (context, index) {
                return const ParallaxWrapper(
                    image:
                        "lib/screens/audioBooksApp/assets/BookCovers/book_1.jpg");
              },
            );
          }),
    );
  }
}
