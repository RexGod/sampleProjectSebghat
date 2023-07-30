import 'package:flutter/material.dart';
import 'package:sample/View/home.dart';
import 'package:sample/View/inquiry.dart';
import 'package:sample/View/login.dart';
import 'package:sample/View/signUp.dart';
import 'package:provider/provider.dart';
import 'package:sample/ViewModel/carsProvider.dart';
import 'package:sample/ViewModel/userProvider.dart';

import 'View/verification.dart';
import 'ViewModel/validation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ProviderCar(),
        ),
        ChangeNotifierProvider.value(value: ProviderUser()),
        ChangeNotifierProvider.value(value: Setting())
      ],
      child: MaterialApp(home: SignUpScreen(), routes: {
        'login': (context) => loginuser(),
        'verification': (context) => verificationUser(),
        'home': (context) => HomePage(),
        'inquiry': (context) => Inquiry(),
      }),
    );
  }
}
