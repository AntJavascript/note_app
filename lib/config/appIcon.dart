import 'package:flutter/material.dart';

class AppIconData extends IconData {
  const AppIconData(int code) : super(code, fontFamily: "Schyler");
}

class AppIcons {
  static const aliPay = AppIconData(0xe900);
  static const car = AppIconData(0xe901);
  static const card = AppIconData(0xe902);
  static const communicate = AppIconData(0xe903);
}
