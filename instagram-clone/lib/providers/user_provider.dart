import 'package:flutter/material.dart';
import 'package:insta_demo/models/users.dart';
import 'package:insta_demo/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  Users? _user;

  final AuthMethods _authMethods = AuthMethods();

  Users? get getUser => _user;

  Future<void> refreshUser() async {
    Users user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}