import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  var token = '';
  Future<void> authLogin(String username, String password) async {
    final url = Uri.parse('http://zaytun.matrixfitness.uz/api/auth');
    final response = await http.post(url, body: {
      'login': username,
      'password': password,
    });
    token = jsonDecode(response.body)['token'];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('login', username);
    prefs.setString('password', password);
    notifyListeners();
  }
}
