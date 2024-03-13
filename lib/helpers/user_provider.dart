// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  String? _email;
  String? _password;
  static const String _keyLogin = 'login';

  get email => _email;
  get password => _password;
  get keyLogin => _keyLogin;

  Future<bool> setEmail(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _email = value;
    prefs.setBool(_keyLogin, true);
    notifyListeners();
    return true;
  }

  Future<bool> setPassword(String value) async {
    _password = value;
    notifyListeners();
    return true;
  }
}
