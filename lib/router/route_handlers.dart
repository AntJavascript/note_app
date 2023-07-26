import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../Views/Home/home.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return Home();
});
