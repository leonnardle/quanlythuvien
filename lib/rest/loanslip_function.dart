
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/loanslip.dart';
import '../utils.dart';
List<LoanSlip> parseloanslip(String responseBody) {
  final parsed = json.decode(responseBody)['data'] as List<dynamic>;
  return parsed.map<LoanSlip>((json) => LoanSlip.fromJson(json)).toList();
}

Future<List<LoanSlip>> fetchloanslip() async {
  final response = await http.get(Uri.parse('${Utils.baseUrl}/phieumuon'));
  if (response.statusCode == 200) {
    return parseloanslip(response.body);
  } else {
    throw Exception('unable connect to api');
  }
}
Future<void> insertloanslip(LoanSlip book) async {
  try {
    final response =  await http.post(
        Uri.parse('${Utils.baseUrl}/phieumuon'),
        headers: {"Accept": "application/json"},
        body: {
          "maphieu":book.id,
          "madocgia": book.idreader,
          "masach": book.idBook,
          "ngaymuon": book.loanDay
        }
    );

    if (response.statusCode == 200) {
      print('Đã thêm sách thành công');

    } else {
      print('Đã xảy ra lỗi khi thêm  sách muon ${book.loanDay}');
    }
  } catch (e) {
    print('Đã xảy ra lỗi khi gửi yêu cầu xóa sách: $e');
  }
}
Future<void> updateloanslip(LoanSlip book) async {
  try {
    final response =  await http.put(
        Uri.parse('${Utils.baseUrl}/phieumuon'),
        headers: {"Accept": "application/json"},
        body: {

          "madocgia": book.idreader,
          "masach": book.idBook,
          "ngaymuon": book.loanDay,
          "maphieu":book.id
        }
    );

    if (response.statusCode == 200) {
      print('thanh cong ${book.loanDay}');
    } else {
      print('Đã xảy ra lỗi khi cập nhật sách cho ${book.idreader}');
    }
  } catch (e) {
    print('Đã xảy ra lỗi khi gửi yêu cầu cập nhật sách: $e');
  }
}

Future<void> deleteloanslip(LoanSlip book) async {
  try {
    final response =  await http.delete(
        Uri.parse('${Utils.baseUrl}/phieumuon'),
        headers: {"Accept": "application/json"},
        body: {
          'maphieu': book.id,
        }
    );

    if (response.statusCode == 200) {
      print('Đã xóa sách thành công');

    } else {
      print('tồn tại mã phiếu trong table sachmuon  ');
    }
  } catch (e) {
    print('Đã xảy ra lỗi khi gửi yêu cầu xóa nhật sách: $e');
  }
}
