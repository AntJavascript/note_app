import 'package:flutter/material.dart';

Map<String, dynamic> appConfig() {
  Map<String, dynamic> config = {};

  config["ThemColor"] = Colors.yellow;

  config["ButtonBgColor"] = Colors.yellow;
  config["ButtonDisableColor"] = Colors.grey;

  config["LineSpaceColor"] = Colors.grey;

  config["iconColor"] = Colors.white;
  config["iconDisableColor"] = Colors.grey;
  config["iconBgColor"] = Colors.yellow;
  config["iconDisableBgColor"] = Colors.grey;

  config["Income"] = Colors.red;
  config["expend"] = Colors.green;

  return config;
}
