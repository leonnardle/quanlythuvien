class Reader {
  late String id;
  late String name;
  late String email;
  late String phonenumber;
  late String loanId;
  Reader();
  factory Reader.fromJson(Map<String, dynamic> data) {
    Reader publisher = Reader();
    publisher.id = data['madocgia'] ?? '';
    publisher.name = data['tendocgia'] ?? '';
    publisher.email = data['email'] ?? '';
    publisher.phonenumber = data['sdt'] ?? '';
    publisher.loanId = data['maphieumuon'] ?? '';
    return publisher;
  }
}
