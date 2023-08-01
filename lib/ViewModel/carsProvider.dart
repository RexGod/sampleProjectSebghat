import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sample/Model/cars.dart';

class ProviderCar with ChangeNotifier {
  final List<Car> _carLit = [];
  List<Car> get carList => _carLit;
  String getCurrentDate() {
    DateTime now = DateTime.now();
    return DateFormat('yyyy/MM/dd').format(now);
  }

  void addCar(
    String userId,
    String years_of_product,
    String model,
    String carId,
    String brand,
    String color,
    String date,
  ) {
    _carLit.add(Car(
      model: model,
      brand: brand,
      color: color,
      date: date,
      userid: userId,
      years_of_Produce: years_of_product,
      id: carId,
    ));
    notifyListeners();
    print(_carLit.toString());
  }
}
