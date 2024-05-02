import 'dart:convert';
import 'package:http/http.dart' as http;

import '../utils.dart';

List<String> parseList(String responseBody) {
  final parsed = json.decode(responseBody)['data'] as List<dynamic>;
  return parsed.map<String>((json) => json.toString()).toList();
}
Future<List<String>> fetchListName(String url,String component) async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return parsetypeName(response.body,component);
  } else {
    throw Exception('unable connect to api');
  }
}
Future<String?> getName(String id,String component,String url) async {
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var typeName = data['data'][0][component];
      return typeName;
    } else {
      // Xử lý lỗi nếu cần
      return "lỗi khi truy cập api";
    }
  } catch (e) {
    return "không thể lấy tên loại ${id}";
  }
}
List<String> parsetypeName(String responseBody,String component) {
  final parsed = json.decode(responseBody)['data'] as List<dynamic>;
  List<String> loanIds = [];
  for (var item in parsed) {
    loanIds.add(item[component].toString());
  }
  return loanIds;
}
