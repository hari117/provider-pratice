import 'package:flutter/material.dart';

class SignInDetailsModel extends ChangeNotifier {

  String _user = "";
  DateTime _signInOn;
  String get user => _user;
  DateTime get signInOn => _signInOn;

  void signIn(String userName) {
    _user = userName;
    _signInOn = DateTime.now();
    notifyListeners();
  }
}