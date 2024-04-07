import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle boldTextFieldStyle() {
    return const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins');
  }

  static TextStyle headlineTextFieldStyle() {
    return const TextStyle(
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins');
  }

  static TextStyle lightTextFieldStyle() {
    return const TextStyle(
        color: Colors.black45,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins');
  }

  static TextStyle semiBoldTextFieldStyle() {
    return const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins');
  }

  static TextStyle semiLightTextFieldStyle() {
    return const TextStyle(
        color: Colors.black45,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins');
  }
}
