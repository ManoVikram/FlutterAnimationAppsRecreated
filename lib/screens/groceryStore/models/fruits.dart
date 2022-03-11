class Fruit {
  final String name;
  final String price;
  final String image;
  final String description;

  Fruit({
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });
}

List<Fruit> fruits = [
  Fruit(
    name: "Apple",
    price: "50",
    image: "lib/screens/groceryStore/assets/Apple.png",
    description:
        "Blossoms, fruits, and leaves of the apple tree (Malus domestica). The apple is a deciduous tree, generally standing 2 to 4.5 m (6 to 15 ft) tall in cultivation and up to 9 m (30 ft) in the wild. When cultivated, the size, shape and branch density are determined by rootstock selection and trimming method. The leaves are alternately arranged dark green-colored simple ovals with serrated margins and slightly downy undersides.",
  ),
  Fruit(
    name: "Banana",
    price: "40",
    image: "lib/screens/groceryStore/assets/Banana.png",
    description:
        "A banana is an elongated, edible fruit botanically a berry produced by several kinds of large herbaceous flowering plants in the genus Musa. In some countries, bananas used for cooking may be called plantains, distinguishing them from dessert bananas.",
  ),
  Fruit(
    name: "Grapes",
    price: "30",
    image: "lib/screens/groceryStore/assets/Grapes.png",
    description:
        "A grape is a fruit, botanically a berry, of the deciduous woody vines of the flowering plant genus Vitis.",
  ),
  Fruit(
    name: "Mango",
    price: "20",
    image: "lib/screens/groceryStore/assets/Mango.png",
    description:
        "A mango is an edible stone fruit produced by the tropical tree Mangifera indica which is believed to have originated from the region between northwestern Myanmar, Bangladesh, and northeastern India.",
  ),
  Fruit(
    name: "Pine Apple",
    price: "10",
    image: "lib/screens/groceryStore/assets/PineApple.png",
    description:
        "The pineapple (Ananas comosus) is a tropical plant with an edible fruit; it is the most economically significant plant in the family Bromeliaceae. The pineapple is indigenous to South America, where it has been cultivated for many centuries.",
  ),
  Fruit(
    name: "Strawberry",
    price: "60",
    image: "lib/screens/groceryStore/assets/Strawberry.png",
    description:
        "The garden strawberry (or simply strawberry; Fragaria ananassa) is a widely grown hybrid species of the genus Fragaria, collectively known as the strawberries, which are cultivated worldwide for their fruit.",
  ),
  Fruit(
    name: "Watermelon",
    price: "70",
    image: "lib/screens/groceryStore/assets/WaterMelon.png",
    description:
        "Watermelon (Citrullus lanatus) is a flowering plant species of the Cucurbitaceae family and the name of its edible fruit. A scrambling and trailing vine-like plant, it is a highly cultivated fruit worldwide, with more than 1,000 varieties.",
  ),
];
