import 'package:ecommerce/API/api_categories/api_categories.dart';
import 'package:ecommerce/API/api_categories/user.dart';
import 'package:ecommerce/model/enum/load_status.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProviderSignIn extends ChangeNotifier{
  final RestClient restClient;
  String? username;
  String? password;
  String? token;
  User? user;
  LoadStatus loadStatus = LoadStatus.loading;
  ProviderSignIn(this.restClient);

  Future<void> _storeToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    notifyListeners();
  }

  Future<User?> getUser(String username, String password,) async {
    try {
      this.username = username;
      this.password = password;
      final token = await restClient.getLogin(username, password, );
      this.user = token;
      await _storeToken(token as String);
      print('Đăng nhập thành công! Token: $token');
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

}