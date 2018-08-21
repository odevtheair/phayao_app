import 'dart:async';

import 'package:http/http.dart' as http;

class ApiProvider {
  ApiProvider();

  String apiUrl = '';

  Future<http.Response> getUsers() async {
    String url = 'https://randomuser.me/api/?results=50';
    return await http.get(url);
  }
}
