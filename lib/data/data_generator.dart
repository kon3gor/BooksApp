import 'dart:math';

import 'package:books_app/domain/models/book.dart';

List<Snippet> getData() {
  return List.generate(10, (int ind) => Snippet("Snippet #$ind"));
}

List<Snippet> getData2() {
  return List.generate(100, (int ind) => Snippet("Snippet #${ind * 2}"));
}

List<Book> getModels() {
  return List.generate(
    10,
    (index) => Book(
      "Test title $index",
      "by Me",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
      "https://covers.openlibrary.org/b/id/9256651.jpg",
      false,
    ),
  );
}

Random r = Random(1);

List<Book> getModels2(String request) {
  return List.generate(
    r.nextInt(10),
    (index) => Book(
      "Test title $index",
      "by Me",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
      "https://covers.openlibrary.org/b/id/9256651.jpg",
      false,
    ),
  );
}

class Snippet {
  String title;

  Snippet(this.title);
}
