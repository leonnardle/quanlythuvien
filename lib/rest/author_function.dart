import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:thuctap/model/author.dart';
import '../utils.dart';
import 'getlist_function.dart';

List<Author> parseAuthor(String responseBody) {
  final parsed = json.decode(responseBody)['data'] as List<dynamic>;
  return parsed.map<Author>((json) => Author.fromJson(json)).toList();
}

Future<List<Author>> fetchAuthor() async {
  final response = await http.get(Uri.parse('${Utils.baseUrl}/tacgia'));
  if (response.statusCode == 200) {
    return parseAuthor(response.body);
  } else {
    throw Exception('unable connect to api');
  }
}
Future<void> insertAuthor(Author author) async {
  try {
    final response =  await http.post(
        Uri.parse('${Utils.baseUrl}/tacgia'),
        headers: {"Accept": "application/json"},
        body: {
          'matacgia': author.id,
          'tentacgia': author.name,
          'quoctich': author.country,
          'tieusu': author.story
        }
    );

    if (response.statusCode == 200) {
      print('Đã thêm loại sách thành công');

    } else {
      print('Đã xảy ra lỗi khi thêm loại sách cho ${author.id}');
    }
  } catch (e) {
    print('Đã xảy ra lỗi khi gửi yêu cầu thêm loại sách: $e');
  }
}
Future<void> updateAuthor(Author author) async {
  try {
    final response =  await http.put(
        Uri.parse('${Utils.baseUrl}/tacgia'),
        headers: {"Accept": "application/json"},
        body: {

          'tentacgia': author.name,
          'quoctich': author.country,
          'tieusu': author.story,
          'matacgia': author.id
        }
    );

    if (response.statusCode == 200) {
     print(response.body);

    } else {
      print('Đã xảy ra lỗi khi cập nhật loại sách cho ${author.id}');
    }
  } catch (e) {
    print('Đã xảy ra lỗi khi gửi yêu cầu cập nhật loại sách: $e');
  }
}
Future<void> deleteAuthor(Author book) async {
  try {
    final response =  await http.delete(
        Uri.parse('${Utils.baseUrl}/tacgia'),
        headers: {"Accept": "application/json"},
        body: {
          'matacgia': book.id,
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
Future<List<String>> fetchidAuthor() async {
  final response = await http.get(Uri.parse('${Utils.baseUrl}/sach/authorlist'));
  if (response.statusCode == 200) {
    return parsetypeName(response.body,"matacgia");
  } else {
    throw Exception('unable connect to api');
  }
}