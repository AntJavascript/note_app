import 'package:flutter/material.dart';

class AppSkin with ChangeNotifier {
  // app主题颜色
  MaterialColor _appSkin = Colors.yellow;
  MaterialColor get color => _appSkin;

  void setAppSkin(MaterialColor color) {
    _appSkin = color;
    notifyListeners();
  }
}
