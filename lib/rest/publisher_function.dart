import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/publisher.dart';
import '../utils.dart';

Future<void> updatePublisher(Publisher publisher) async {
  try {
    final response =  await http.put(
        Uri.parse('${Utils.baseUrl}/nhaxuatban'),
        headers: {"Accept": "application/json"},
        body: {
          'tennxb': publisher.name,
          'khuvuc': publisher.area,
          'manxb': publisher.id
        }
    );

    if (response.statusCode == 200) {
      print('thanh cong');
    } else {
      print('Đã xảy ra lỗi khi cập nhật sách cho ${publisher.id}');
    }
  } catch (e) {
    print('Đã xảy ra lỗi khi gửi yêu cầu cập nhật sách: $e');
  }
}
Future<void> deletePublisher(Publisher publisher) async {
  try {
    final response =  await http.delete(
        Uri.parse('${Utils.baseUrl}/nhaxuatban'),
        headers: {"Accept": "application/json"},
        body: {
          'manxb': publisher.id,
        }
    );

    if (response.statusCode == 200) {
      print('Đã xóa sách thành công');

    } else {
      print('Đã xảy ra lỗi khi xóa nhật sách cho ${publisher.id}');
    }
  } catch (e) {
    print('Đã xảy ra lỗi khi gửi yêu cầu xóa nhật sách: $e');
  }
}
Future<void> insertPublisher(Publisher publisher) async {
  try {
    final response =  await http.post(
        Uri.parse('${Utils.baseUrl}/nhaxuatban'),
        headers: {"Accept": "application/json"},
        body: {
          'tennxb': publisher.name,
          'manxb': publisher.id,
          'khuvuc': publisher.area
        }
    );

    if (response.statusCode == 200) {
      print('Đã thêm sách thành công');

    } else {
      print('Đã xảy ra lỗi khi thêm  sách cho ${publisher.id}');
    }
  } catch (e) {
    print('Đã xảy ra lỗi khi gửi yêu cầu xóa  sách: $e');
  }
}

List<Publisher> parsePublishers(String responseBody) {
  final parsed = json.decode(responseBody)['data'] as List<dynamic>;
  return parsed.map<Publisher>((json) => Publisher.fromJson(json)).toList();
}

Future<List<Publisher>> fetchPublishers() async {
  final response = await http.get(Uri.parse('${Utils.baseUrl}/nhaxuatban'));
  if (response.statusCode == 200) {
    return parsePublishers(response.body);
  } else {
    throw Exception('unable connect to api');
  }
}