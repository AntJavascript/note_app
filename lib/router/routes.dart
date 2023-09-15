import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import './route_handlers.dart';

/**
 * 路由配置
*/

class Routes {
  static String root = "/";
  static String create = "/create";
  static String login = "/login";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return;
    });
    router.define(root, handler: rootHandler);
    router.define(create, handler: createRouteHandler);
    router.define(login, handler: loginRouteHandler);
  }
}
