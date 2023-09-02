import 'package:flutter/material.dart';

class AppIconData extends IconData {
  const AppIconData(int code) : super(code, fontFamily: "Schyler");
}

class CusIcons {
  static const aliPay = AppIconData(0xe900);
  static const car = AppIconData(0xe901);
  static const card = AppIconData(0xe902);
  static const communicate = AppIconData(0xe903);
  static const iconDate = AppIconData(0xe904);
  static const ecommerce = AppIconData(0xe905);
  static const education = AppIconData(0xe906);
  static const find = AppIconData(0xe907);
  static const gift = AppIconData(0xe908);
  static const holiday = AppIconData(0xe909);
  static const housing = AppIconData(0xe90a);
  static const hydropower = AppIconData(0xe90b);
  static const medical = AppIconData(0xe90c);
  static const necessities = AppIconData(0xe90d);
  static const other = AppIconData(0xe90e);
  static const redEnvelope = AppIconData(0xe90f);
  static const restaurant = AppIconData(0xe910);
  static const smoke = AppIconData(0xe911);
  static const taix = AppIconData(0xe912);
  static const transfer = AppIconData(0xe913);
  static const travel = AppIconData(0xe91b);
  static const warn = AppIconData(0xe91c);
  static const weChart = AppIconData(0xe91d);
}

Map<String, dynamic> _appIcons() {
  Map<String, dynamic> data = {};

  data["aliPay"] = CusIcons.aliPay;
  data["car"] = CusIcons.car;
  data["card"] = CusIcons.card;
  data["communicate"] = CusIcons.communicate;
  data["iconDate"] = CusIcons.iconDate;
  data["ecommerce"] = CusIcons.ecommerce;
  data["education"] = CusIcons.education;
  data["find"] = CusIcons.find;
  data["gift"] = CusIcons.gift;
  data["holiday"] = CusIcons.holiday;
  data["housing"] = CusIcons.housing;
  data["hydropower"] = CusIcons.hydropower;
  data["medical"] = CusIcons.medical;
  data["necessities"] = CusIcons.necessities;
  data["other"] = CusIcons.other;
  data["redEnvelope"] = CusIcons.redEnvelope;
  data["restaurant"] = CusIcons.restaurant;
  data["smoke"] = CusIcons.smoke;
  data["taix"] = CusIcons.taix;
  data["transfer"] = CusIcons.transfer;
  data["travel"] = CusIcons.travel;
  data["warn"] = CusIcons.warn;
  data["weChart"] = CusIcons.weChart;

  return data;
}

final appIcons = _appIcons();
