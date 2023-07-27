import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';

class TitleCell extends StatelessWidget {

  final String title;
  const TitleCell({Key? key, this.title}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          TailBox().border(Colors.blue, 2).mx(6).Container(),
          TailTypo().text_color(Colors.black).Text(title)
        ]
      )
    )
  }
}
