

class Book {
  late String id;
  late String name;
  late String author;
  late String publisher;
  late String genre;
  late String description;
  late String image;

  Book();

  factory Book.fromJson(Map<String, dynamic> data) {
    Book book = Book();
    book.id = data['masach'] ?? '';
    book.name = data['tensach'] ?? '';
    book.author = data['tacgia'] ?? '';
    book.publisher = data['nhaxuatban'] ?? '';
    book.genre = data['theloai'] ?? '';
    book.description = data['mota'] ?? '';
    book.image = data['image'] ?? '';
    return book;
  }

  // Sử dụng các hàm setter để thiết lập giá trị cho các trường late final
  void setName(String text) {
    name = text;
  }
  void setId(String text) {
    id = text;
  }

  void setAuthor(String text) {
    author = text;
  }

  void setGenre(String text) {
    genre = text;
  }

  void setPublisher(String text) {
    publisher = text;
  }

  void setDescription(String text) {
    description = text;
  }

  void setImage(String text) {
    image = text;
  }
}



