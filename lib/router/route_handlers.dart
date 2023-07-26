import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return HomeComponent();
});
