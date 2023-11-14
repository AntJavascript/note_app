import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
// app主题颜色
import 'package:note_app/provider/skin_model.dart';

class Progress extends StatelessWidget {
  final double value;

  const Progress({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double radius = 6;
    return Container(
        child: Stack(children: [
      Container(
          height: 6.0,
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(radius)))),
      Positioned(
          child: Container(
              child: Text("${value.toString()}%"),
              decoration: BoxDecoration(
                  color: Provider.of<AppSkin>(context).color,
                  borderRadius: BorderRadius.all(Radius.circular(radius)))))
    ]));
  }
}
