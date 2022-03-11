class Product {
  final String? title, image, price, category;

  Product({
    this.title,
    this.image,
    this.price,
    this.category,
  });
}

List<Product> products = [
  Product(
    title: "Cabbage",
    image: "assets/images/img_1.png",
    price: "20.00",
    category: "Vegetables",
  ),
  Product(
    title: "Broccoli",
    image: "assets/images/img_2.png",
    price: "20.00",
    category: "Vegetables",
  ),
  Product(
    title: "Carrot",
    image: "assets/images/img_3.png",
    price: "20.00",
    category: "Vegetables",
  ),
  Product(
    title: "Pakcoy",
    image: "assets/images/img_4.png",
    price: "20.00",
    category: "Vegetables",
  ),
  Product(
    title: "Cucumber",
    image: "assets/images/img_1.png",
    price: "20.00",
    category: "Vegetables",
  ),
];
