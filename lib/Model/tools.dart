class Tools {
  final String userId;
  final String type;
  final String name;
  final String brand;
  final String number;
  final String state;

  Tools(
      {required this.userId,
      required this.type,
      required this.name,
      required this.brand,
      required this.number,
      required this.state});

  @override
  String toString() {
    return 'Type: $type, Name: $name, Brand: $brand, Number: $number, State: $state';
  }
}
