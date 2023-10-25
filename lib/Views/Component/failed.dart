import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';

// 全局配置
import 'package:note_app/config/them.dart';

class Failed extends StatelessWidget {
  const Failed(
      {Key? key, this.text = "加载失败，点击重试", this.height = 100, this.onClick})
      : super(key: key);

  final String? text;
  final double? height;
  final Function? onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onClick!();
        },
        child: Container(
            height: height,
            alignment: Alignment.center,
            child: TailTypo()
                .font_size(14.0)
                .text_color(AppColorConfig.labelColor)
                .Text(text!)));
  }
}
