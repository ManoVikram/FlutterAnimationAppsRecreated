import 'package:flutter/material.dart';

import 'models/places.dart';

class TravelPhotosHomeScreen extends StatefulWidget {
  const TravelPhotosHomeScreen({Key? key}) : super(key: key);

  @override
  State<TravelPhotosHomeScreen> createState() => _TravelPhotosHomeScreenState();
}

class _TravelPhotosHomeScreenState extends State<TravelPhotosHomeScreen> {
  final GlobalKey<AnimatedListState> _animatedListKey =
      GlobalKey<AnimatedListState>();

  // final List<int> items = List.generate(10, (index) => index);

  Place place = places[0];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              height: size.height / 2,
              child: TopImage(place: place, size: size),
            ),
            Positioned(
              //! 150 / 2 = 75 -> 150 is the height of the horizontal scroll view
              top: size.height / 2 - 75,
              left: 0,
              right: 0,
              height: 150,
              child: AnimatedList(
                key: _animatedListKey,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                initialItemCount: places.length,
                itemBuilder: (context, index, animation) {
                  return InkWell(
                    onTap: () {
                      places.insert(places.length, places[index]);

                      _animatedListKey.currentState!
                          .insertItem(places.length - 1);

                      Place itemToDelete = places[index];

                      print(places[index].name);

                      setState(() {
                        place = places[index];
                      });

                      places.removeAt(index);

                      _animatedListKey.currentState!.removeItem(
                        index,
                        (context, animation) => FadeTransition(
                          opacity: animation,
                          child: SizeTransition(
                            sizeFactor: animation,
                            axis: Axis.horizontal,
                            child: TravelPhotoListItem(place: itemToDelete),
                          ),
                        ),
                      );
                    },
                    child: TravelPhotoListItem(place: places[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopImage extends StatelessWidget {
  const TopImage({
    Key? key,
    required this.place,
    required this.size,
  }) : super(key: key);

  final Place place;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          place.mainImage,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: size.height * 0.07,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              place.name,
              style: const TextStyle(
                fontSize: 70.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TravelPhotoListItem extends StatelessWidget {
  const TravelPhotoListItem({
    Key? key,
    required this.place,
  }) : super(key: key);

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SizedBox(
          height: 160.0,
          width: 110.0,
          child: Image.asset(
            place.subImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
