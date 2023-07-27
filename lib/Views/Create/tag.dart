import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tailstyle/tailstyle.dart';

class Tag extends StatefulWidget {

  final String text;
  final bool? isActive;

  this.Tag(text, {
    this.isActive = false,
  })

  @override
  State<StatefulWidget> createState() => TagState();
}

class TagState extends State<Tag>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // 文本颜色
    Color text_color = isActive ? Color.fromARGB(255, 120, 120, 120) : Color.fromARGB(255, 220, 220, 220);
    // 边框颜色
    Color border_color = isActive ? Color.fromARGB(255, 120, 120, 120) : Color.fromARGB(255, 220, 220, 220);
    // 背景颜色
    Color bg_color = isActive ? Color.fromARGB(255, 120, 120, 120) : Color.fromARGB(255, 220, 220, 220);

    return TailBox().border(border_color, 1).as((s) {
      return s.bg(bg_color).rounded(30).as((s) {
        return s.Container(
          child:TailTypo().text_color(text_color).font_size(12.0).Text(text),
        );
      });
    });
  }
}
