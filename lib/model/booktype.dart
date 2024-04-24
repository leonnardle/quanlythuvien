class BookType {
  late String id;
  late String name;


  BookType();

  factory BookType.fromJson(Map<String, dynamic> data) {
    BookType bookType = BookType();
    bookType.id = data['maloaisach'] ?? '';
    bookType.name = data['tenloaisach'] ?? '';
    return bookType;
  }
  void setName(String text) {
    name = text;
  }
  void setId(String text) {
    id = text;
  }

}
