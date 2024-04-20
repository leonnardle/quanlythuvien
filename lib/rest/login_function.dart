import 'dart:convert';

import 'package:http/http.dart'as http;

import '../utils.dart';


// gửi yêu cầu post đến url dùng để login
Future userLogin(String email, String password) async {
  final response = await http.post(
    Uri.parse('${Utils.baseUrl}/user/login'),
    headers: {"Accept": "application/json"},
    body: {
      'email': email,
      'password': password,
    },
  );
  var decodedData=jsonDecode(response.body);
  return decodedData;
}
