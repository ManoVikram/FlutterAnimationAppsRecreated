class Boat {
  final String title;
  final String designer;
  final String image;
  final String description;
  final String boatLength;
  final String beam;
  final String weight;
  final String fuelCapacity;

  Boat({
    required this.title,
    required this.designer,
    required this.image,
    required this.description,
    required this.boatLength,
    required this.beam,
    required this.weight,
    required this.fuelCapacity,
  });
}

final List<Boat> boats = [
  Boat(
    title: "X22 Lift",
    designer: "Mastercraft",
    image: "lib/screens/boatApp/assets/boat1.png",
    description:
        "Meet the highest-performing inboard waterski boat ever created",
    boatLength: "20' 1.8\"",
    beam: "89\"",
    weight: "2245 KG",
    fuelCapacity: "184 L",
  ),
  Boat(
    title: "X24 Fun",
    designer: "Mastercraft",
    image: "lib/screens/boatApp/assets/boat2.png",
    description:
        "Meet the highest-performing inboard waterski boat ever created",
    boatLength: "22' 2\"",
    beam: "98\"",
    weight: "2680 KG",
    fuelCapacity: "261 L",
  ),
  Boat(
    title: "X24 Force",
    designer: "NeoKraft",
    image: "lib/screens/boatApp/assets/boat3.png",
    description:
        "Meet the highest-performing inboard waterski boat ever created",
    boatLength: "24' 2\"",
    beam: "102\"",
    weight: "2767 KG",
    fuelCapacity: "322 L",
  ),
  Boat(
    title: "X22 Fun",
    designer: "NeoKraft",
    image: "lib/screens/boatApp/assets/boat4.png",
    description:
        "Meet the highest-performing inboard waterski boat ever created",
    boatLength: "20' 1.8\"",
    beam: "89\"",
    weight: "2245 KG",
    fuelCapacity: "184 L",
  ),
  Boat(
    title: "X20 Lite",
    designer: "NeoKraft",
    image: "lib/screens/boatApp/assets/boat5.png",
    description:
        "Meet the highest-performing inboard waterski boat ever created",
    boatLength: "20' 1.8\"",
    beam: "89\"",
    weight: "2245 KG",
    fuelCapacity: "184 L",
  ),
];
