import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:note_app/Views/Home/home.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return Home();
});
