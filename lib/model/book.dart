import 'dart:convert';
import 'package:http/http.dart' as http;

import '../utils.dart';

class Book {
  final String id;
  late String name;
  late String author;
  late String publisher;
  late String genre;
  late String description;
  late int quantity;
  late String image;

  Book(
      this.id,
      this.name,
      this.author,
      this.publisher,
      this.genre,
      this.description,
      this.quantity,
      this.image,
      );

  factory Book.fromJson(Map<String, dynamic> data) {
    return Book(
      data['masach'],
      data['tensach'],
      data['tacgia'],
      data['nhaxuatban'],
      data['theloai'],
      data['mota'],
      data['soluong'],
      data['image'],
    );
  }

  // Sử dụng các hàm setter để thiết lập giá trị cho các trường late final
  void setName(String text) {
    name = text;
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

  void printBook() {
    print('ID: $id');
    print('Name: $name');
    print('Author: $author');
    print('Publisher: $publisher');
    print('Genre: $genre');
    print('Description: $description');
    print('Quantity: $quantity');
    print('Image: $image');
  }

}

List<Book> parseBooks(String responseBody) {
  final parsed = json.decode(responseBody)['data'] as List<dynamic>;
  return parsed.map<Book>((json) => Book.fromJson(json)).toList();
}

Future<List<Book>> fetchBooks() async {
  final response = await http.get(Uri.parse('${Utils.baseUrl}/sach'));
  if (response.statusCode == 200) {
    return parseBooks(response.body);
  } else {
    throw Exception('unable connect to api');
  }
}
Future<void> updateBook(Book book) async {
  try {
    final response = await http.put(
      Uri.parse('${Utils.baseUrl}/sach'),
      headers: {"Accept": "application/json"},
      body: jsonEncode({
        'tensach': book.name,
        'tacgia': book.author,
        'nhaxuatban': book.publisher,
        'theloai': book.genre,
        'mota': book.description,
        'image': book.image,
        "masach": book.id,
      }),
    );
    if (response.statusCode == 200) {
      book.printBook();
      print(response.body);
    } else {
      print('Đã xảy ra lỗi khi cập nhật sách cho ${book.id}');
    }
  } catch (e) {
    print('Đã xảy ra lỗi khi gửi yêu cầu cập nhật sách: $e');
  }
}
