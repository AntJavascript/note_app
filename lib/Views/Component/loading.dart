import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';

// 全局配置
import 'package:note_app/config/them.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key, this.text = "数据加载中...", this.height = 100})
      : super(key: key);

  final String? text;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        alignment: Alignment.center,
        child: TailTypo()
            .font_size(14.0)
            .text_color(AppColorConfig.labelColor)
            .Text(text!));
  }
}
