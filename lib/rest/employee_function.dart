import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/Employee.dart';
import '../utils.dart';

List<Employee> parseEmployee(String responseBody) {
  final parsed = json.decode(responseBody)['data'] as List<dynamic>;
  return parsed.map<Employee>((json) => Employee.fromJson(json)).toList();
}

Future<List<Employee>> fetchEmployee() async {
  final response = await http.get(Uri.parse('${Utils.baseUrl}/nhanvien'));
  if (response.statusCode == 200) {
    return parseEmployee(response.body);
  } else {
    throw Exception('unable connect to api');
  }
}

Future<void> insertEmployee(Employee employee) async {
  try {
    final response =
        await http.post(Uri.parse('${Utils.baseUrl}/nhanvien'), headers: {
      "Accept": "application/json"
    }, body: {
      'manv': employee.id,
      'tennv': employee.name,
      'email': employee.email,
      'sdt': employee.phonenumber,
      'matkhau': employee.password,
      'songaycong': employee.worknumber.toString(),
      'luong': employee.salary.toString()
    });

    if (response.statusCode == 200) {
      print('Đã thêm nhân viên thành công');
    } else {
      print('Đã xảy ra lỗi khi thêm nhân viên cho ${employee.id}');
    }
  } catch (e) {
    print('Đã xảy ra lỗi khi gửi yêu cầu thêm nhân viên: $e');
  }
}

Future<void> updateEmployee(Employee book) async {
  try {
    final response =  await http.put(
        Uri.parse('${Utils.baseUrl}/nhanvien'),
        headers: {"Accept": "application/json"},
        body: {
          'manv': book.id,
          'tennv': book.name,
          'email': book.email,
          'sdt': book.phonenumber,
          'matkhau': book.password,
          'songaycong': book.worknumber.toString(),
          'luong': book.salary.toString()
        }
    );

    if (response.statusCode == 200) {
      print(response.body);
      fetchEmployee();

    } else {
      print('Đã xảy ra lỗi khi cập nhật loại sách cho ${book.id}');
    }
  } catch (e) {
    print('Đã xảy ra lỗi khi gửi yêu cầu cập nhật loại sách: $e');
  }
}

Future<void> deleteEmployee(Employee book) async {
  try {
    final response =
        await http.delete(Uri.parse('${Utils.baseUrl}/nhanvien'), headers: {
      "Accept": "application/json"
    }, body: {
      'manv': book.id,
    });

    if (response.statusCode == 200) {
      print('Đã xóa loại sách thành công');
    } else {
      print('Đã xảy ra lỗi khi xóa loại sách cho ${book.id}');
    }
  } catch (e) {
    print('Đã xảy ra lỗi khi gửi yêu cầu xóa loại sách: $e');
  }
}
