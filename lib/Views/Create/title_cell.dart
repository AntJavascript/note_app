import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';

// 全局配置
import 'package:note_app/config/them.dart';

class TitleCell extends StatelessWidget {
  final String title;
  const TitleCell(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      TailBox().border(AppColorConfig.themColor, 2).mx(6).Container(),
      TailTypo().text_color(Colors.black).Text(title)
    ]);
  }
}
