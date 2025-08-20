import 'package:flutter/material.dart';

abstract class AppColors {
  static const Gradient gradientBackGroundDecoration = LinearGradient(
    colors: [
      Color.fromARGB(255, 1, 124, 224),
      Color.fromARGB(208, 141, 1, 165),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const Color white = Colors.white;
  static const Color black = Color.fromARGB(161, 0, 0, 0);
  static const Color transparent = Colors.transparent;
  static const Color grey = Colors.grey;
  static const Color deepPurple = Color.fromARGB(220, 124, 71, 216);
  static const Color red = Colors.red;
  static const Color green = Color.fromARGB(255, 4, 53, 5);
}
