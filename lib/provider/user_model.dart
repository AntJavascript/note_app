import 'package:flutter/cupertino.dart';

class UserInfo with ChangeNotifier {
  
  // 个人信息
  Map<String, dynamic> _userInfo;
  String get getUserInfo => _userInfo;

  void setUserInfo(Map<String, dynamic> data) {
    _userInfo = data;
    notifyListeners();
  }

}
