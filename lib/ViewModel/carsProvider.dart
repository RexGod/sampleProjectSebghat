import 'package:flutter/material.dart';

class ProviderCar with ChangeNotifier {
  List<Map<dynamic, dynamic>> _carLit = [];
  List<Map<dynamic, dynamic>> get carList => _carLit;

  
  void addCar(String userId, String carId, String model,
      String years_of_product, String brand, String color, String discription) {
    _carLit.add({
      'userid': userId,
      'id': carId,
      'model': model,
      'brand': brand,
      'years_of_Produce': years_of_product,
      'discription': discription,
      'color': color,
    });
    notifyListeners();
    print(_carLit.toString());
  }
}
