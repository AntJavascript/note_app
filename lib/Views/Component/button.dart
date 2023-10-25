import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';

// 全局配置
import 'package:note_app/config/them.dart';

import 'package:provider/provider.dart';
// app主题颜色
import 'package:note_app/provider/skin_model.dart';

class NoteButton extends StatelessWidget {
  const NoteButton(
      {Key? key,
      this.onClick,
      this.text = '确定',
      this.height = 44,
      this.width,
      this.radius = 0,
      this.textColor = AppColorConfig.buttonTextColor})
      : super(key: key);

  final Function? onClick;
  final String? text;
  final double? height;
  final double? width;
  final double? radius;

  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick!();
      },
      child: Container(
        height: height,
        alignment: Alignment.center,
        width: width,
        child: TailTypo().text_color(textColor).Text(text!),
        decoration: BoxDecoration(
            color: Provider.of<AppSkin>(context).color,
            borderRadius: BorderRadius.all(Radius.circular(radius!))),
      ),
    );
  }
}
