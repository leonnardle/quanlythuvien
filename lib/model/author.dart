class Author {
  late String id;
  late String name;
  late String country;
  late String story;

  Author();
  factory Author.fromJson(Map<String, dynamic> data) {
    Author book = Author();
    book.id = data['matacgia'] ?? '';
    book.name = data['tentacgia'] ?? '';
    book.country = data['quoctich'] ?? '';
    book.story = data['tieusu'] ?? '';

    return book;
  }
}
