import 'package:flutter/material.dart';

import '../Model/tools.dart';

class Providertool with ChangeNotifier {
  final List<Tools> _toolsList = [];
  List<Tools> get toolList => _toolsList;

  void addTool(String userId, String type, String name, String brand,
      String number, String state) {
    _toolsList.add(Tools(
        userId: userId,
        type: type,
        name: name,
        brand: brand,
        number: number,
        state: state));
    notifyListeners();
    for (var i = 0; i < toolList.length; i++) {
      print(toolList[i].toString());
    }
  }

  Tools? searchToolById(String id) {
    return _toolsList.firstWhere((tool) => tool.userId == id);
  }
}
