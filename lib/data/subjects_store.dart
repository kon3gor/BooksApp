import 'package:books_app/domain/models/subject.dart';

class Subjects {
  Subjects._();

  static const _description =
      "Fantasy ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum";

  static const Subject fantasy = Subject(
    name: "Fantasy",
    description: _description,
    image: "graphics/fantasy.png",
  );

  static const Subject scienceFiction = Subject(
    name: "Science Fiction",
    description: _description,
    image: "graphics/science_fiction.png",
  );

  static const Subject classics = Subject(
    name: "Classics",
    description: _description,
    image: "graphics/classics.png",
  );

  static const Subject horror = Subject(
    name: "Horror",
    description: _description,
    image: "graphics/horror.png",
  );

  static const Subject detective = Subject(
    name: "Detective",
    description: _description,
    image: "graphics/detective.png",
  );

  static const Subject magic = Subject(
    name: "Magic",
    description: _description,
    image: "graphics/magic.png",
  );
}
