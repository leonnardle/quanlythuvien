DateTime? parseDateTime(dynamic value) {
  if (value is DateTime) {
    return value;
  } else if (value is String) {
    return DateTime.tryParse(value);
  }
  return null;
}

class LoanSlip {
  late String id;
  late String idBook;
  late String idreader;
  late String loanDay;

  LoanSlip();

  factory LoanSlip.fromJson(Map<String, dynamic> data) {
    LoanSlip book = LoanSlip();
    book.id = data['maphieu'] ?? '';
    book.idBook = data['masach'] ?? '';
    book.idreader = data['madocgia'] ?? '';
    book.loanDay = parseDateTime(data['ngaymuon'])?.toString() ?? '';
    return book;
  }
}
