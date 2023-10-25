import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';

// 全局配置
import 'package:note_app/config/them.dart';

import 'package:provider/provider.dart';
// app主题颜色
import 'package:note_app/provider/skin_model.dart';

class TitleCell extends StatelessWidget {
  const TitleCell({super.key, this.title = ""});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: 4,
        height: 14,
        color: Provider.of<AppSkin>(context).color,
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      ),
      TailTypo()
          .font_size(16)
          .text_color(const Color.fromARGB(255, 92, 92, 92))
          .Text(title!),
    ]);
  }
}
