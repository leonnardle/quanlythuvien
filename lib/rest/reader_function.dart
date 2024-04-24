import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:thuctap/model/reader.dart';


import '../utils.dart';

Future<void> updatereader(Reader reader) async {
  try {
    final response =  await http.put(
        Uri.parse('${Utils.baseUrl}/docgia'),
        headers: {"Accept": "application/json"},
        body: {
          'tendocgia': reader.name,
          'email': reader.email,
          'sdt': reader.phonenumber,
          'maphieumuon': reader.loanId,
          'madocgia': reader.id
        }
    );

    if (response.statusCode == 200) {
      print('thanh cong');
    } else {
      print('Đã xảy ra lỗi khi cập nhật sách cho ${reader.id}');
    }
  } catch (e) {
    print('Đã xảy ra lỗi khi gửi yêu cầu cập nhật sách: $e');
  }
}
Future<void> deletereader(Reader reader) async {
  try {
    final response =  await http.delete(
        Uri.parse('${Utils.baseUrl}/docgia'),
        headers: {"Accept": "application/json"},
        body: {
          'madocgia': reader.id
        }
    );

    if (response.statusCode == 200) {
      print('Đã xóa sách thành công');

    } else {
      print('Đã xảy ra lỗi khi xóa nhật sách cho ${reader.id}');
    }
  } catch (e) {
    print('Đã xảy ra lỗi khi gửi yêu cầu xóa nhật sách: $e');
  }
}
Future<void> insertreader(Reader reader) async {
  try {
    final response =  await http.post(
        Uri.parse('${Utils.baseUrl}/docgia'),
        headers: {"Accept": "application/json"},
        body: {
          'madocgia': reader.id,
          'tendocgia': reader.name,
          'email': reader.email,
          'sdt': reader.phonenumber,
          'maphieumuon': reader.loanId

        }
    );

    if (response.statusCode == 200) {
      print('Đã thêm sách thành công');

    } else {
      print('Đã xảy ra lỗi khi thêm  sách cho ${reader.id}');
    }
  } catch (e) {
    print('Đã xảy ra lỗi khi gửi yêu cầu xóa  sách: $e');
  }
}

List<Reader> parsereaders(String responseBody) {
  final parsed = json.decode(responseBody)['data'] as List<dynamic>;
  return parsed.map<Reader>((json) => Reader.fromJson(json)).toList();
}

Future<List<Reader>> fetchreaders() async {
  final response = await http.get(Uri.parse('${Utils.baseUrl}/docgia'));
  if (response.statusCode == 200) {
    return parsereaders(response.body);
  } else {
    throw Exception('unable connect to api');
  }
}
List<String> parseLoanid(String responseBody) {
  final parsed = json.decode(responseBody)['data'] as List<dynamic>;
  List<String> loanIds = [];
  for (var item in parsed) {
    loanIds.add(item['maphieu'].toString());
  }
  return loanIds;
}

Future<List<String>> fetchLoanId() async {
  final response = await http.get(Uri.parse('${Utils.baseUrl}/maphieumuon'));
  if (response.statusCode == 200) {
    return parseLoanid(response.body);
  } else {
    throw Exception('unable connect to api');
  }
}