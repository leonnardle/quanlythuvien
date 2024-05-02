

class BookBorrow {
  late String idborrow;
  late String bookname;
  late String idreader;
  late String loanid;
  late String idbook;
  late String image;

  BookBorrow();

  factory BookBorrow.fromJson(Map<String, dynamic> data) {
    BookBorrow book = BookBorrow();
    book.idborrow = data['mamuonsach'] is int ? data['mamuonsach'].toString() : data['mamuonsach'] ?? '';
    book.bookname = data['tensach'] ?? '';
    book.idreader = data['madocgia'] ?? '';
    book.loanid = data['maphieumuon'] ?? '';
    book.idbook = data['masach'] ?? '';
    book.image = data['image'] ?? '';
    return book;
  }

}



