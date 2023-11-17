import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';
import 'package:provider/provider.dart';

// 全局配置
import 'package:note_app/config/them.dart';

class Cell extends StatelessWidget {
  const Cell({Key? key, this.title, this.income, this.expend})
      : super(key: key);

  final String? title;
  final String? income;
  final String? expend;

  @override
  Widget build(BuildContext context) {
    return TailBox().p(10).m_b(12).rounded(6).bg(Colors.white).Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
          TailTypo().font_size(16.0).Text(title!),
          Column(children: [
            Container(
              child: Row(children: [
                TailTypo().font_size(12.0).text_color(Colors.grey).Text("支出"),
                TailTypo()
                    .font_size(16.0)
                    .text_color(AppColorConfig.expendTextColor)
                    .Text(expend!),
              ]),
            ),
            Container(
              child: Row(
                children: [
                  TailTypo().font_size(12.0).text_color(Colors.grey).Text("收入"),
                  TailTypo()
                      .font_size(16.0)
                      .text_color(AppColorConfig.incomeTextColor)
                      .Text(income!),
                ],
              ),
            ),
          ]),
        ]));
  }
}
