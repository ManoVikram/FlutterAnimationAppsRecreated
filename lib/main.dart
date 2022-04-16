import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_flutter_animations/screens/web_scroll_01/web_scroll_01_home_screen.dart';
import 'package:provider/provider.dart';

import './screens/homeScreen/home_screen.dart';
import './screens/groceryStore/models/cart.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        /* ChangeNotifierProvider(
          create: (context) => PizzaSelectionProvider(),
        ), */
      ],
      child: MaterialApp(
        title: "Learning Flutter Animations",
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        ),
        home: const LearningFlutterAnimations(),
      ),
    );
  }
}

class LearningFlutterAnimations extends StatelessWidget {
  const LearningFlutterAnimations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebScroll01HomeScreen(),
    );
  }
}

void main() => runApp(const MyApp());
