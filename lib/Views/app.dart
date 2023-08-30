import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:note_app/router/application.dart';
import 'package:note_app/router/routes.dart';

// 全局配置
import 'package:note_app/config/them.dart';

// 自定义组件
import 'Home/home.dart';

class App extends StatelessWidget {
  App({super.key}) {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: Home(),
      onGenerateRoute: Application.router.generator,
    );
  }
}
