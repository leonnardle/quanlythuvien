import 'dart:convert';

import 'package:thuctap/model/booktype.dart';
import 'package:http/http.dart' as http;
import '../utils.dart';
import 'getlist_function.dart';

List<BookType> parseBookType(String responseBody) {
  final parsed = json.decode(responseBody)['data'] as List<dynamic>;
  return parsed.map<BookType>((json) => BookType.fromJson(json)).toList();
}

Future<List<BookType>> fetchBookType() async {
  final response = await http.get(Uri.parse('${Utils.baseUrl}/loaisach'));
  if (response.statusCode == 200) {
    return parseBookType(response.body);
  } else {
    throw Exception('unable connect to api');
  }
}
Future<void> insertBooktype(BookType booktype) async {
  try {
    final response =  await http.post(
        Uri.parse('${Utils.baseUrl}/loaisach'),
        headers: {"Accept": "application/json"},
        body: {
          'maloaisach': booktype.id,
          'tenloaisach': booktype.name,
        }
    );

    if (response.statusCode == 200) {
      print('Đã thêm loại sách thành công');

    } else {
      print('Đã xảy ra lỗi khi thêm loại sách cho ${booktype.id}');
    }
  } catch (e) {
    print('Đã xảy ra lỗi khi gửi yêu cầu thêm loại sách: $e');
  }
}
Future<void> updateBooktype(BookType book) async {
  try {
    final response =  await http.put(
        Uri.parse('${Utils.baseUrl}/loaisach'),
        headers: {"Accept": "application/json"},
        body: {
          'maloaisach': book.id,
          'tenloaisach': book.name
        }
    );

    if (response.statusCode == 200) {
      fetchBookType();

    } else {
      print('Đã xảy ra lỗi khi cập nhật loại sách cho ${book.id}');
    }
  } catch (e) {
    print('Đã xảy ra lỗi khi gửi yêu cầu cập nhật loại sách: $e');
  }
}
Future<void> deleteBooktype(BookType book) async {
  try {
    final response =  await http.delete(
        Uri.parse('${Utils.baseUrl}/loaisach'),
        headers: {"Accept": "application/json"},
        body: {
          'maloaisach': book.id,
        }
    );

    if (response.statusCode == 200) {
      print('Đã xóa loại sách thành công');

    } else {
      print('Đã xảy ra lỗi khi xóa loại sách cho ${book.id}');
    }
  } catch (e) {
    print('Đã xảy ra lỗi khi gửi yêu cầu xóa loại sách: $e');
  }
}

Future<List<String>> fetchtypeName() async {
  final response = await http.get(Uri.parse('${Utils.baseUrl}/sach/tenloaisach'));
  if (response.statusCode == 200) {
    return parsetypeName(response.body,"tenloaisach");
  } else {
    throw Exception('unable connect to api');
  }
}