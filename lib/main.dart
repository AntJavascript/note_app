import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 路由配置
import 'package:note_app/router/application.dart';

// 用户信息
import 'package:note_app/provider/user_model.dart';
// app主题颜色
import 'package:note_app/provider/skin_model.dart';

// 自定义组件
import 'Views/app.dart';

void main() {
  autoLogin();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserInfo()),
      ChangeNotifierProvider(create: (_) => AppSkin()),
    ],
    child: App(),
  ));

  if (Platform.isAndroid) {
    // 设置沉浸式状态栏
    SystemUiOverlayStyle systemUiOverlayStyle =
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

// 是否登录过
void autoLogin() async {
  SharedPreferences prefer = await SharedPreferences.getInstance();

  var access_token = prefer.get("access_token");
  var refresh_token = prefer.get("refresh_token");

  // 不存在token,跳转登录界面
  if (access_token == null || refresh_token == null) {
    print("跳转登录");
  }
}
