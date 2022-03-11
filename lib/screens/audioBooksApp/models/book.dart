class Book {
  final String title;
  final String author;
  final String coverImage;

  Book({
    required this.title,
    required this.author,
    required this.coverImage,
  });
}

final List<Book> books = [
  Book(
    title: "Wink Poppy Midnight",
    author: "April Genevieve Tucholke",
    coverImage: "lib/screens/audioBooksApp/assets/BookCovers/book_1.jpg",
  ),
  Book(
    title: "Walking With Miss Millie",
    author: "Tamara Bundy",
    coverImage: "lib/screens/audioBooksApp/assets/BookCovers/book_2.jpg",
  ),
  Book(
    title: "Trio",
    author: "Sarah Tolmie",
    coverImage: "lib/screens/audioBooksApp/assets/BookCovers/book_3.jpg",
  ),
  Book(
    title: "The Jungle Book",
    author: "Rudyard Kipling",
    coverImage: "lib/screens/audioBooksApp/assets/BookCovers/book_4.jpg",
  ),
  Book(
    title: "The Maker Of Swams  ",
    author: "Paraig O'Donnell",
    coverImage: "lib/screens/audioBooksApp/assets/BookCovers/book_5.jpg",
  ),
];
