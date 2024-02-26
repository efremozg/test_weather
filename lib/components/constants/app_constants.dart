import 'package:flutter/material.dart';

class AppConstants {
  static const Color blueColor = Color.fromARGB(255, 8, 0, 255);
  static const Color blackColor = Color.fromARGB(255, 0, 0, 0);
  static const Color whiteColor = Color.fromARGB(255, 255, 255, 255);
  static const Color greyColor = Color.fromARGB(255, 135, 153, 165);
  static const Color transparentGreyColor = Color.fromARGB(120, 135, 153, 165);
  static const Color purpleColor = Color.fromARGB(255, 189, 135, 255);

  static String cloudImage = "assets/images/cloud.png";
}

String toCelsius(double temp) {
  var value = (temp - 32) * 5 / 9;
  return value.floor().toString();
}
