import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:note_app/Views/Home/home.dart';
import 'package:note_app/Views/Create/index.dart';
import 'package:note_app/Views/Login/login.dart';

/**
 * 路由处理函数
*/

var rootHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const HomePage();
});

var createRouteHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return Create();
});

var loginRouteHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return Login();
});
var detailRouteHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      final int id = params['id']?.first ?? 0;
      final String type = params['type']?.first ?? '';
  return DetailPage(id: int.parse(id), type: type);
});
