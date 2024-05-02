import 'dart:convert';

import '../model/book.dart';
import 'package:http/http.dart' as http;

import '../utils.dart';

Future<void> updateBook(Book book) async {
  try {
    final response =  await http.put(
      Uri.parse('${Utils.baseUrl}/sach'),
      headers: {"Accept": "application/json"},
      body: {
        'tensach': book.name,
        'tacgia': book.author,
        'nhaxuatban': book.publisher,
        'theloai': book.genre,
        'mota': book.description,
        'image': book.image,
        'masach': book.id
      }
    );

    if (response.statusCode == 200) {
     fetchBooks();

    } else {
      print(book.publisher);
      print('Đã xảy ra lỗi khi cập nhật sách cho ${book.id}');
    }
  } catch (e) {
    print('Đã xảy ra lỗi khi gửi yêu cầu cập nhật sách: $e');
  }
}
Future<void> deleteBook(Book book) async {
  try {
    final response =  await http.delete(
        Uri.parse('${Utils.baseUrl}/sach'),
        headers: {"Accept": "application/json"},
        body: {
          'masach': book.id,
        }
    );

    if (response.statusCode == 200) {
      print('Đã xóa sách thành công');

    } else {
      print('Đã xảy ra lỗi khi xóa nhật sách cho ${book.id}');
    }
  } catch (e) {
    print('Đã xảy ra lỗi khi gửi yêu cầu xóa nhật sách: $e');
  }
}
Future<void> insertBook(Book book) async {
  try {
    final response =  await http.post(
        Uri.parse('${Utils.baseUrl}/sach'),
        headers: {"Accept": "application/json"},
        body: {
          'masach': book.id,
          'tensach': book.name,
          'tacgia': book.author,
          'nhaxuatban': book.publisher,
          'theloai': book.genre,
          'mota': book.description,
          'image': book.image
        }
    );

    if (response.statusCode == 200) {
      print('Đã thêm sách thành công');

    } else {
      print('Đã xảy ra lỗi khi thêm  sách cho ${book.id}');
    }
  } catch (e) {
    print('Đã xảy ra lỗi khi gửi yêu cầu xóa  sách: $e');
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
Future<String> updateGenre(String genre)async{
  final response = await http.get(Uri.parse('${Utils.baseUrl}/sach/tenloaisach2/$genre'));
  if(response.statusCode==200){
    final parsed = json.decode(response.body)['data'][0]['maloaisach'] as String;
    return parsed;
  }
  else
    {
      throw Exception("unable connect api ");
    }
}
Future<String> updatenameAuthor(String genre)async{
  final response = await http.get(Uri.parse('${Utils.baseUrl}/sach/authorname/$genre'));
  if(response.statusCode==200){
    final parsed = json.decode(response.body)['data'][0]['matacgia'] as String;
    return parsed;
  }
  else
  {
    throw Exception("unable connect api ");
  }
}
Future<String> updatenamePublisher(String genre) async {
  final response = await http.get(Uri.parse('${Utils.baseUrl}/sach/publishername/$genre'));
  if(response.statusCode==200){
    final parsed = json.decode(response.body)['data'][0]['tennxb'] as String;
    return parsed;
  }
  else
  {
    throw Exception("unable connect api ");
  }
}
