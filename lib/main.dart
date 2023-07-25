import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 自定义组件
import 'Views/app.dart';

void main() {
  runApp(const App());

  if (Platform.isAndroid) {
    // 设置沉浸式状态栏
    SystemUiOverlayStyle systemUiOverlayStyle =
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
