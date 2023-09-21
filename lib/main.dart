import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

// 用户信息
import 'package:note_app/provider/user_model.dart';
// app主题颜色
import 'package:note_app/provider/skin_model.dart';

// 自定义组件
import 'Views/app.dart';

void main() {
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
