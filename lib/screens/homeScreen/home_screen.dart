import 'package:flutter/material.dart';

import '../animatedBanking/banking_home_screen.dart';
import '../audioBooksApp/audio_books_home_screen.dart';
import '../batmanSignup/batman_home_screen.dart';
import '../boatApp/boat_home_screen.dart';
import '../coffeeApp/coffee_home_screen.dart';
import '../customAnimations/custom_animation.dart';
import '../animatedAuthentication/authentication_home_screen.dart';
import '../explandableNavBar/expandable_nav_bar_home_screen.dart';
import '../groceryApp/grocery_home_screen.dart';
import '../groceryStore/grocery_home_screen.dart';
import '../pizzaOrderApp/pizza_order_home_screen.dart';
import '../travelPhotosApp/travel_photos_home_screen.dart';
import '../vinylDiskApp/vinyl_disk_home_screen.dart';
import '../explicitAnimationsScreen/explicit_animations_screen.dart';
import '../implicitAnimationsScreen/implicit_animations.dart';
import '../dbrand_skin_selection/dbrand_home_screen.dart';
import '../nikeConcept/nike_home_screen.dart';
import '../googleMessages/google_messages_home_screen.dart';
import '../nikeShoeStore/nike_store_home_screen.dart';
import '../animatedLoadingScreen/animated_loading_home_screen.dart';

import './widgets/my_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Animations"),
        titleTextStyle: const TextStyle(
          color: Colors.white,
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyButton(
                  size: size,
                  text: "Implicit Animations",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ImplicitAnimations(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                MyButton(
                  size: size,
                  text: "Explicit Animations",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ExplicitAnimationsScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                MyButton(
                  size: size,
                  text: "Custom Animations",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CustomAnimation(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                MyButton(
                  size: size,
                  text: "Grocery App",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GroceryApp(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                MyButton(
                  size: size,
                  text: "Animated Authentication",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AuthenticationHomeScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                MyButton(
                  size: size,
                  text: "Coffee App",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CoffeeHomeScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                MyButton(
                  size: size,
                  text: "Vinyl Disk",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VinylDiskHomeScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                MyButton(
                  size: size,
                  text: "DBrand Pop Skins",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DbrandHomeScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                MyButton(
                  size: size,
                  text: "Nike Concept",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NikeHomeScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                MyButton(
                  size: size,
                  text: "Expandable Nav Bar",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const ExpandableNavBarHomeScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                MyButton(
                  size: size,
                  text: "Google Messages",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GoogleMessagesHomeScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                MyButton(
                  size: size,
                  text: "Banking App",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BankingHomeScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                MyButton(
                  size: size,
                  text: "Audio Books App",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AudioBooksHomeScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                MyButton(
                  size: size,
                  text: "Boat App",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BoatHomeScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                MyButton(
                  size: size,
                  text: "Grocery Store",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GroceryStoreHomeScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                MyButton(
                  size: size,
                  text: "Nike Shoe Store",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NikeStoreHomeScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                MyButton(
                  size: size,
                  text: "Travel Photos App",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TravelPhotosHomeScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                MyButton(
                  size: size,
                  text: "Batman Signup",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BatmanHomeScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                MyButton(
                  size: size,
                  text: "Pizza Shopping",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PizzaOrderHomeScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                MyButton(
                  size: size,
                  text: "Animated Loading Screen",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AnimatedLoadingHomeScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
