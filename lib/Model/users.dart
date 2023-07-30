class User {
  final String name;
  late String? id;
  final String phone;
  final String email;
  final String password;
  late int? tokenVerify;

  User({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
  });
}
