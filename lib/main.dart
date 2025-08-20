import 'package:flutter/material.dart';
import 'package:shop_app/screens/login_screen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Suwannaphum'),
      home: LoginScreen(),
    );
  }
}
