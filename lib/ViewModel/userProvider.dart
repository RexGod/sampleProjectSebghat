import 'dart:math';

import 'package:flutter/material.dart';

class ProviderUser with ChangeNotifier {
  final List<Map<String, dynamic>> _userList = [
    {
      /* 'id': '',
      'name': 'shadmehr',
      'phone': '09336474811',
      'email': 'shadmehrmanoochehri@gmail.com',
      'password': 'Sh@0831@sh' */
    },
    {
      'id': '8bb123b0-2d36-11ee-9664-dd2b5f267044',
      'name': 'شادمهر',
      'phone': '09336474811',
      'email': 'shadmehrmanoochehri@gmail.com',
      'password': 'Sh@0831@Sh'
    }
  ];
  List<Map<String, dynamic>> get userList => _userList;

  void addUser(
      String id, String name, String email, String phone, String password) {
    _userList.add({
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'password': password
    });
    notifyListeners();
    print(_userList.toString());
  }

  int generateRandomNumberInRange() {
    /* Random random = Random();
    int code = random.nextInt(9000) + 1000; */
    int code = 1000;
    print(code);
    return code;
  }

  bool login(String phone) {
    bool isFound = false;
    for (var i in userList) {
      if (i['phone'] == phone) {
        i['tokenVerify'] = generateRandomNumberInRange();
        isFound = true;
        break;
      }
    }

    return isFound;
  }

  bool isVerified(int code) {
    bool verified = false;
    for (var i in userList) {
      if (i['tokenVerify'] == code) {
        verified = true;
        break;
      }
    }
    return verified;
  }

  String findid(String phone) {
    var id = '';
    for (var i in userList) {
      if (i['phone'] == phone) {
        id = i['id'];
        break;
      }
    }
    return id;
  }

  Map<String, dynamic>? getRecordById(String id) {
    return _userList.firstWhere((record) => record['id'] == id);
  }

  void logout(String id) {
    for (var i in _userList) {
      if (i['id'] == id) {
        i['tokenVerify'] =
            null; // Set tokenVerify to null to mark user as logged out
        break;
      }
    }
    notifyListeners();
  }
}
