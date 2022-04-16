import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './widgets/scroll_image_wrapper.dart';

class WebScroll01HomeScreen extends StatelessWidget {
  WebScroll01HomeScreen({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider.value(
        value: _scrollController,
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500.0),
            alignment: Alignment.center,
            child: ListView.builder(
              controller: _scrollController,
              itemCount: 10,
              itemBuilder: (context, index) {
                return ScrollImageWrapper(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      "lib/screens/travelPhotosApp/assets/Images/America.jpg",
                      height: 300.0,
                      width: 300.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
