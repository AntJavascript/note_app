import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tailstyle/tailstyle.dart';

class Tag extends StatefulWidget {
  final String text;
  final bool? isActive;

  const Tag(
    this.text, {
    super.key,
    this.isActive = false,
  });

  @override
  State<StatefulWidget> createState() => TagState();
}

class TagState extends State<Tag> {
  get isActive => widget.isActive == true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 文本颜色
    Color textColor = isActive
        ? Color.fromARGB(255, 236, 123, 79)
        : Color.fromARGB(255, 78, 78, 78);
    // 边框颜色
    Color borderColor = isActive
        ? Color.fromARGB(255, 120, 120, 120)
        : Color.fromARGB(255, 220, 220, 220);
    // 背景颜色
    Color bgColor = isActive
        ? Color.fromARGB(255, 236, 182, 161)
        : Color.fromARGB(255, 247, 247, 247);

    return TailBox()
        .border(borderColor, 1)
        .px(14)
        .py(6)
        .m(4)
        .rounded(30)
        .bg(bgColor)
        .Container(
            child: TailTypo()
                .text_color(textColor)
                .font_size(12)
                .Text(widget.text));
  }
}
