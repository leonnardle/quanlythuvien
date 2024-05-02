
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:thuctap/model/borrowbook.dart';

import '../utils.dart';

List<BookBorrow> parseBookBorrow(String responseBody) {
  final parsed = json.decode(responseBody)['data'] as List<dynamic>;
  return parsed.map<BookBorrow>((json) => BookBorrow.fromJson(json)).toList();
}

Future<List<BookBorrow>> fetchBookBorrow() async {
  final response = await http.get(Uri.parse('${Utils.baseUrl}/sachmuon'));
  if (response.statusCode == 200) {
    return parseBookBorrow(response.body);
  } else {
    throw Exception('unable connect to api');
  }
}
Future<void> insertBookborrow(BookBorrow book) async {
  try {
    final response =  await http.post(
        Uri.parse('${Utils.baseUrl}/sachmuon'),
        headers: {"Accept": "application/json"},
        body: {
          "tensach":book.bookname,
          "madocgia": book.idreader,
          "maphieumuon": book.loanid,
          "masach": book.idbook
        }
    );

    if (response.statusCode == 200) {
      print('Đã thêm sách thành công');

    } else {
      print('Đã xảy ra lỗi khi thêm  sách muon');
    }
  } catch (e) {
    print('Đã xảy ra lỗi khi gửi yêu cầu xóa sách: $e');
  }
}
Future<void> updateBookborrow(BookBorrow book) async {
  try {
    final response =  await http.put(
        Uri.parse('${Utils.baseUrl}/sachmuon'),
        headers: {"Accept": "application/json"},
        body: {
          "tensach":book.bookname,
          "madocgia": book.idreader,
          "maphieumuon": book.loanid,
          "masach": book.idbook,
          "mamuonsach": book.idborrow
        }
    );

    if (response.statusCode == 200) {
      print('thanh cong');
    } else {
      print('Đã xảy ra lỗi khi cập nhật sách cho ${book.idreader}');
    }
  } catch (e) {
    print('Đã xảy ra lỗi khi gửi yêu cầu cập nhật sách: $e');
  }
}
Future<void> deleteBookborrow(BookBorrow book) async {
  try {
    final response =  await http.delete(
        Uri.parse('${Utils.baseUrl}/sachmuon'),
        headers: {"Accept": "application/json"},
        body: {
          'mamuonsach': book.idborrow,
        }
    );

    if (response.statusCode == 200) {
      print('Đã xóa sách thành công');

    } else {
      print('Đã xảy ra lỗi khi xóa nhật sách cho ${book.idborrow}');
    }
  } catch (e) {
    print('Đã xảy ra lỗi khi gửi yêu cầu xóa nhật sách: $e');
  }
}
