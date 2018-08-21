import 'dart:async';

import 'package:http/http.dart' as http;

class ApiProvider {
  ApiProvider();

  String apiUrl = 'http://203.209.96.245/webservice_r1/web/index.php/api';

  Future<http.Response> getUsers() async {
    String url = 'https://randomuser.me/api/?results=50';
    return await http.get(url);
  }

  Future<http.Response> getQof() async {
    String url = '$apiUrl/qof';
    return await http.get(url);
  }

  Future<http.Response> getQofChw(String qofId) async {
    String url = '$apiUrl/qofchw?id=$qofId';
    return await http.get(url);
  }

  Future<http.Response> getQofAmp(String chwCode, String qofId) async {
    String url = '$apiUrl/qofamp?chwcode=$chwCode&id=$qofId';
    return await http.get(url);
  }
}
