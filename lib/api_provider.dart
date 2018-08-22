import 'dart:async';
import 'dart:io';

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

  Future<http.Response> doLogin(String username, String password) async {
    String url = 'https://2898411d.ngrok.io/login';
    var params = {'username': username, 'password': password};
    return await http.post(url, body: params);
  }

  Future<http.Response> getApiUsers(String token) async {
    String url = 'https://2898411d.ngrok.io/users';
    return await http.get(
      url,
      headers: {HttpHeaders.AUTHORIZATION: "Bearer $token"},
    );
  }
}
