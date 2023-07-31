// ignore_for_file: public_member_api_docs, sort_constructors_first

class Car {
  String? date;
  String? userid;
  String? id;
  final String model;
  final String brand;
  String? years_of_Produce;

  String? color;

  Car(
      {this.userid,
      this.id,
      required this.model,
      required this.brand,
      this.years_of_Produce,
      this.color,
      this.date});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Car &&
          runtimeType == other.runtimeType &&
          brand == other.brand &&
          model == other.model;

  @override
  int get hashCode => brand.hashCode ^ model.hashCode;

  @override
  String toString() {
    return 'Car(date: $date, userid: $userid, id: $id, model: $model, brand: $brand, years_of_Produce: $years_of_Produce, color: $color)';
  }
}
