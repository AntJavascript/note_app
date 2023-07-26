import 'package:flutter/cupertino.dart';

class UserInfo with ChangeNotifier {
  // 个人信息
  late Map<String, dynamic> _userInfo;
  Map<String, dynamic> get getUserInfo => _userInfo;

  void setUserInfo(Map<String, dynamic> data) {
    _userInfo = data;
    notifyListeners();
  }
}
