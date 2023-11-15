import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';

import 'package:provider/provider.dart';

// 全局配置
import 'package:note_app/config/them.dart';

// app主题颜色
import 'package:note_app/provider/skin_model.dart';
import 'package:note_app/Views/Home/Widgets/line_space.dart';

class TotalCard extends StatefulWidget {
  const TotalCard({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TotalCardState();
}

// 文字显示
Widget Income(String text, {String type = 'income'}) {
  bool isIncome = type == 'income';
  return TailTypo()
      .font_size(16.0)
      .text_color(isIncome
          ? AppColorConfig.expendTextColor
          : AppColorConfig.incomeTextColor)
      .Text(text);
}

// 金额显示
Widget Amount(String text, {String type = 'income'}) {
  bool isIncome = type == 'income';
  return TailTypo()
      .font_size(24.0)
      .text_color(isIncome
          ? AppColorConfig.expendTextColor
          : AppColorConfig.incomeTextColor)
      .Text(isIncome ? "+${text}" : "-${text}");
}

// 数据显示
Widget ShowData(String type, String title, String amount) {
  return Expanded(
      child: Column(
    children: [
      Income(title, type: type),
      Amount(amount, type: type),
    ],
  ));
}

class _TotalCardState extends State<TotalCard> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(6),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Provider.of<AppSkin>(context).color,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TailTypo().font_size(14.0).text_color(Colors.black).Text('总计收支'),
          SizedBox(
            height: 20,
          ),
          Row(children: [
            ShowData("expend", "支出", '9852.56'),
            ShowData("income", "收入", '0.0')
          ]),
        ]));
  }
}
