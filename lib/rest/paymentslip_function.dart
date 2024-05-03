
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:thuctap/model/paymentslip.dart';
import '../utils.dart';
List<PaySlip> parsepayslip(String responseBody) {
  final parsed = json.decode(responseBody)['data'] as List<dynamic>;
  return parsed.map<PaySlip>((json) => PaySlip.fromJson(json)).toList();
}

Future<List<PaySlip>> fetchpayslip() async {
  final response = await http.get(Uri.parse('${Utils.baseUrl}/phieutra'));
  if (response.statusCode == 200) {
    return parsepayslip(response.body);
  } else {
    throw Exception('unable connect to api');
  }
}
Future<void> insertpayslip(PaySlip book) async {
  try {
    final response =  await http.post(
        Uri.parse('${Utils.baseUrl}/phieutra'),
        headers: {"Accept": "application/json"},
        body: {
          "maphieu":book.idSlip,
          "maphieumuon": book.idLoan
        }
    );

    if (response.statusCode == 200) {
      print('Đã thêm phieu tra công');

    } else {
      print('Đã xảy ra lỗi khi thêm  phieu tra ');
    }
  } catch (e) {
    print( e);
  }
}
Future<void> updatepayslip(PaySlip book) async {
  try {
    final response =  await http.put(
        Uri.parse('${Utils.baseUrl}/phieutra'),
        headers: {"Accept": "application/json"},
        body: {
          "ngaytra":book.paymentDay,
          "maphieumuon": book.idLoan,
          "maphieu":book.idSlip
        }
    );

    if (response.statusCode == 200) {
      print('Đã sửa phieu tra thành công ${book.paymentDay}');

    } else {
      print('Đã xảy ra lỗi khi sửa  phieu tra ');
    }
  } catch (e) {
    print( e);
  }
}
Future<void> deletepayslip(PaySlip book) async {
  try {
    final response =  await http.delete(
        Uri.parse('${Utils.baseUrl}/phieutra'),
        headers: {"Accept": "application/json"},
        body: {
          "maphieu":book.idSlip
        }
    );

    if (response.statusCode == 200) {
      print('Đã sửa phieu tra thành công ${book.paymentDay}');

    } else {
      print('Đã xảy ra lỗi khi sửa  phieu tra ');
    }
  } catch (e) {
    print( e);
  }
}
