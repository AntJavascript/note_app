import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
// app主题颜色
import 'package:note_app/provider/skin_model.dart';

class Progress extends StatelessWidget {
  final num value;

  const Progress({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double radius = 6;
    return Container(
        child: Stack(children: [
      Container(
          height: 16.0,
          width: MediaQuery.of(context).size.width * value / 100,
          decoration: BoxDecoration(
              color: Provider.of<AppSkin>(context).color,
              borderRadius: BorderRadius.all(Radius.circular(radius)))),
      Positioned(
          right: 0,
          child: Text(
            style: TextStyle(fontSize: 12),
            "${value.toString()}%",
          ))
    ]));
  }
}
