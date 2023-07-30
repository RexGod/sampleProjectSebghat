import 'package:sample/Model/users.dart';

class Car {
  User? userid;
  String? id;
  final String model;
  final String brand;
  String? years_of_Produce;
  String? discription;
  String? color;

  Car(
      {this.userid,
      this.id,
      required this.model,
      required this.brand,
      this.years_of_Produce,
      this.discription,
      this.color});
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Car &&
          runtimeType == other.runtimeType &&
          brand == other.brand &&
          model == other.model;

  @override
  int get hashCode => brand.hashCode ^ model.hashCode;
}
