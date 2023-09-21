import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:note_app/router/application.dart';
import 'package:note_app/router/routes.dart';

// 全局配置
import 'package:note_app/config/them.dart';
// app主题颜色
import 'package:note_app/provider/skin_model.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Provider.of<AppSkin>(context).color,
      ),
      home: Home(),
      onGenerateRoute: Application.router.generator,
    );
  }
}
